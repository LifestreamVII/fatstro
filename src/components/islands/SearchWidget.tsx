import { h } from 'preact';
import { useState } from 'preact/hooks';

const sampleData = [
  'Astro Islands',
  'Partial Hydration',
  'Server-Side Rendering',
  'Static Site Generation',
  'Component Islands',
  'Client Directives',
  'Performance Optimization',
  'Progressive Enhancement',
];

export default function SearchWidget() {
  const [query, setQuery] = useState('');
  const [results, setResults] = useState<string[]>([]);

  const handleSearch = (value: string) => {
    setQuery(value);
    if (value.trim()) {
      const filtered = sampleData.filter(item =>
        item.toLowerCase().includes(value.toLowerCase())
      );
      setResults(filtered);
    } else {
      setResults([]);
    }
  };

  return (
    <div style={{
      padding: '1.5rem',
      background: 'linear-gradient(135deg, #f093fb 0%, #f5576c 100%)',
      borderRadius: '8px',
      boxShadow: '0 4px 6px rgba(0,0,0,0.1)'
    }}>
      <h3 style={{ marginBottom: '1rem', fontSize: '1.5rem', color: 'white' }}>
        Search Widget
      </h3>
      <div style={{ position: 'relative' }}>
        <input
          type="text"
          value={query}
          onInput={(e) => handleSearch((e.target as HTMLInputElement).value)}
          placeholder="Search Astro concepts..."
          style={{
            width: '100%',
            padding: '0.75rem',
            fontSize: '1rem',
            border: '2px solid white',
            borderRadius: '6px',
            background: 'rgba(255,255,255,0.9)',
            outline: 'none'
          }}
        />
        {results.length > 0 && (
          <div style={{
            marginTop: '0.5rem',
            background: 'white',
            borderRadius: '6px',
            boxShadow: '0 2px 8px rgba(0,0,0,0.15)',
            overflow: 'hidden'
          }}>
            {results.map((result, idx) => (
              <div
                key={idx}
                style={{
                  padding: '0.75rem',
                  borderBottom: idx < results.length - 1 ? '1px solid #e5e7eb' : 'none',
                  cursor: 'pointer',
                  transition: 'background 0.2s'
                }}
                onMouseOver={(e) => e.currentTarget.style.background = '#f3f4f6'}
                onMouseOut={(e) => e.currentTarget.style.background = 'white'}
                onClick={() => {
                  setQuery(result);
                  setResults([]);
                }}
              >
                {result}
              </div>
            ))}
          </div>
        )}
      </div>
      <p style={{ marginTop: '1rem', fontSize: '0.875rem', color: 'white', opacity: 0.9 }}>
        ⏱️ Hydrates when browser is idle with client:idle
      </p>
    </div>
  );
}
