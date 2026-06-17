const DIRECTUS_URL = import.meta.env.PUBLIC_DIRECTUS_URL || 'http://localhost:8055';

export interface BlogPost {
  slug: string;
  title: string;
  content: string;
  publish_date: string;
  image?: {
    id: string;
    title: string;
    width: number;
    height: number;
    filename_disk: string;
    type: string;
  };
  author?: {
    id: number;
    name: string;
  };
}

/**
 * Core GraphQL Query Helper
 */
async function directusQuery(query: string, variables?: Record<string, any>) {
  const response = await fetch(`${DIRECTUS_URL}/graphql`, {
    method: 'POST',
    headers: { 
      'Content-Type': 'application/json' 
    },
    body: JSON.stringify({ query, variables: variables || {} }),
  });

  if (!response.ok) {
    throw new Error(`HTTP error! status: ${response.status}`);
  }

  const result = await response.json();

  if (result.errors) {
    throw new Error(result.errors[0]?.message || 'GraphQL error');
  }

  return result.data;
}

/**
 * Get posts with search, filter, and pagination
 */
export async function getPosts(options: { limit?: number; offset?: number; search?: string; filter?: any } = {}): Promise<{ nodes: BlogPost[]; totalCount: number }> {
  const { limit = 10, offset = 0, search, filter } = options;
  const query = `
    query GetPosts($limit: Int, $offset: Int, $search: String, $filter: Posts_filter) {
      Posts(limit: $limit, offset: $offset, search: $search, filter: $filter, sort: ["-publish_date"]) {
        slug
        title
        content
        publish_date
        image {
          id
          title
          width
          height
          filename_disk
          type
        }
        author {
          id
          name
        }
      }
      Posts_aggregated(search: $search, filter: $filter) {
        countAll
      }
    }
  `;

  const data = await directusQuery(query, { limit, offset, search, filter });
  return {
    nodes: data.Posts || [],
    totalCount: data.Posts_aggregated?.[0]?.countAll ?? 0,
  };
}

/**
 * Get a single post by slug
 */
export async function getPostBySlug(slug: string): Promise<BlogPost | null> {
  const query = `
    query GetPostBySlug($slug: String!) {
      Posts(filter: { slug: { _eq: $slug } }) {
        slug
        title
        content
        publish_date
        image {
          id
          title
          width
          height
          filename_disk
          type
        }
        author {
          id
          name
        }
      }
    }
  `;

  const data = await directusQuery(query, { slug });
  return data.Posts?.[0] || null;
}

/**
 * Generate a full image URL based on the Directus Image ID
 */
export function getImageUrl(imageId: string, options: Record<string, any> = {}): string {
  if (!imageId) return '';
  const params = new URLSearchParams(options);
  const queryString = params.toString() ? `?${params.toString()}` : '';
  return `${DIRECTUS_URL}/assets/${imageId}${queryString}`;
}
