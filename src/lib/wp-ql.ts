// WP GraphQL API endpoint
export const WORDPRESS_SITE_URL = (import.meta.env.PUBLIC_WP_SITE_URL ?? 'http://localhost:8000').replace(/\/$/, '');
export const WP_API_ENDPOINT = `${WORDPRESS_SITE_URL}/graphql`;

export const wpquery = async (data: { query: string; variables?: Record<string, unknown> }) : Promise<any> => {
    const response = await fetch(WP_API_ENDPOINT, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      query: data.query,
      variables: data.variables,
    }),
  });

  const result = await response.json();
  return result;
};

/**
 * Get posts with search and pagination (cursor-based)
 */
export async function getPosts(options: { limit?: number; after?: string | null; search?: string } = {}) {
  const { limit = 10, after = null, search } = options;
  const result = await wpquery({
    query: `
      query GetPosts($first: Int!, $after: String, $search: String) {
        posts(
          first: $first
          after: $after
          where: { search: $search, orderby: { field: DATE, order: DESC } }
        ) {
          pageInfo {
            hasNextPage
            endCursor
          }
          nodes {
            id
            title
            slug
            excerpt
            date
          }
        }
      }
    `,
    variables: {
      first: limit,
      after,
      search: search?.trim() || null,
    },
  });

  if (result.errors) {
    throw new Error(result.errors[0]?.message || 'GraphQL error');
  }

  return {
    nodes: result.data.posts.nodes || [],
    hasNextPage: result.data.posts.pageInfo.hasNextPage,
    nextCursor: result.data.posts.pageInfo.endCursor,
  };
}