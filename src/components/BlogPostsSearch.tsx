import { useEffect, useMemo, useState } from 'preact/hooks';
import { getPosts as fetchWP } from '../lib/wp-ql';
import { getPosts as fetchDirectus } from '../lib/directus-ql';

export type Post = {
  id: string;
  title: string;
  slug: string;
  excerpt?: string | null;
  date?: string | null;
};

type Props = {
  initialPosts?: Post[];
  source: 'wp' | 'directus';
  postUrlPrefix: string;
};

const PAGE_SIZE = 10;

export default function BlogPostsSearch({ initialPosts = [], source, postUrlPrefix }: Props) {
  const [query, setQuery] = useState('');
  const [posts, setPosts] = useState<Post[]>(initialPosts);
  const [cursor, setCursor] = useState<string | null>(null);
  const [hasNextPage, setHasNextPage] = useState(initialPosts.length >= PAGE_SIZE);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const canLoadMore = useMemo(() => hasNextPage && !loading, [hasNextPage, loading]);

  const performFetch = async (search: string, currentCursor: string | null) => {
    if (source === 'wp') {
      const res = await fetchWP({ limit: PAGE_SIZE, after: currentCursor, search });
      return {
        nodes: res.nodes,
        hasNextPage: res.hasNextPage,
        nextCursor: res.nextCursor,
      };
    } else {
      const offset = currentCursor ? parseInt(currentCursor, 10) : 0;
      const res = await fetchDirectus({ limit: PAGE_SIZE, offset, search });
      const nodes = res.nodes.map((p: any) => ({
        id: p.slug,
        title: p.title,
        slug: p.slug,
        excerpt: p.content?.substring(0, 150) + '...',
        date: p.publish_date,
      }));
      const nextOffset = offset + PAGE_SIZE;
      const hasNext = nextOffset < res.totalCount;
      return {
        nodes,
        hasNextPage: hasNext,
        nextCursor: hasNext ? nextOffset.toString() : null,
      };
    }
  };

  useEffect(() => {
    const controller = new AbortController();
    const timeoutId = window.setTimeout(async () => {
      setLoading(true);
      setError('');
      try {
        const data = await performFetch(query, null);
        if (controller.signal.aborted) return;
        setPosts(data.nodes);
        setCursor(data.nextCursor);
        setHasNextPage(data.hasNextPage);
      } catch (err) {
        if (!controller.signal.aborted) {
          setError(err instanceof Error ? err.message : 'Failed to load posts');
        }
      } finally {
        if (!controller.signal.aborted) {
          setLoading(false);
        }
      }
    }, 300);

    return () => {
      controller.abort();
      window.clearTimeout(timeoutId);
    };
  }, [query]);

  async function loadMore() {
    if (!canLoadMore) return;
    setLoading(true);
    setError('');
    try {
      const data = await performFetch(query, cursor);
      setPosts((current) => [...current, ...data.nodes]);
      setCursor(data.nextCursor);
      setHasNextPage(data.hasNextPage);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load more posts');
    } finally {
      setLoading(false);
    }
  }

  return (
    <section>
      <input
        type="search"
        value={query}
        placeholder="Search posts..."
        onInput={(e) => setQuery(e.currentTarget.value)}
        style="width:100%; padding:0.75rem; margin-bottom:1.5rem; border:1px solid #ccc; border-radius:4px;"
      />

      {error && <p role="alert" style="color:red;">{error}</p>}

      <div style="display:grid; gap:1.5rem;">
        {posts.map((post) => (
          <article key={post.id} style="padding:1rem; border:1px solid #eee; border-radius:8px;">
            <h2 style="margin:0 0 0.5rem;">
              <a href={`${postUrlPrefix}${post.slug}`}>{post.title}</a>
            </h2>
            {post.excerpt && <div dangerouslySetInnerHTML={{ __html: post.excerpt }} style="font-size:0.9rem; color:#666;" />}
            {post.date && <small style="color:#999;">{new Date(post.date).toLocaleDateString()}</small>}
          </article>
        ))}
      </div>

      <div style="margin-top:2rem; text-align:center;">
        <button onClick={loadMore} disabled={!canLoadMore} style="padding:0.5rem 1rem; cursor:pointer;">
          {loading ? 'Loading...' : hasNextPage ? 'Load More' : 'No More Posts'}
        </button>
      </div>
    </section>
  );
}
