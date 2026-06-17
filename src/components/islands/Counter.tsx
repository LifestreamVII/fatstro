import { h } from 'preact';
import { useState } from 'preact/hooks';

interface CounterProps {
  initialCount?: number;
}

export default function Counter({ initialCount = 0 }: CounterProps) {
  const [count, setCount] = useState(initialCount);

  return (
    <div style={{
      padding: '1.5rem',
      background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
      borderRadius: '8px',
      color: 'white',
      textAlign: 'center',
      boxShadow: '0 4px 6px rgba(0,0,0,0.1)'
    }}>
      <h3 style={{ marginBottom: '1rem', fontSize: '1.5rem' }}>Interactive Counter</h3>
      <div style={{
        fontSize: '3rem',
        fontWeight: 'bold',
        marginBottom: '1rem'
      }}>
        {count}
      </div>
      <div style={{ display: 'flex', gap: '0.5rem', justifyContent: 'center' }}>
        <button
          onClick={() => setCount(count - 1)}
          style={{
            padding: '0.75rem 1.5rem',
            fontSize: '1rem',
            background: 'rgba(255,255,255,0.2)',
            border: '2px solid white',
            borderRadius: '6px',
            color: 'white',
            cursor: 'pointer',
            fontWeight: 'bold',
            transition: 'all 0.2s'
          }}
          onMouseOver={(e) => e.currentTarget.style.background = 'rgba(255,255,255,0.3)'}
          onMouseOut={(e) => e.currentTarget.style.background = 'rgba(255,255,255,0.2)'}
        >
          −
        </button>
        <button
          onClick={() => setCount(initialCount)}
          style={{
            padding: '0.75rem 1.5rem',
            fontSize: '1rem',
            background: 'rgba(255,255,255,0.2)',
            border: '2px solid white',
            borderRadius: '6px',
            color: 'white',
            cursor: 'pointer',
            fontWeight: 'bold',
            transition: 'all 0.2s'
          }}
          onMouseOver={(e) => e.currentTarget.style.background = 'rgba(255,255,255,0.3)'}
          onMouseOut={(e) => e.currentTarget.style.background = 'rgba(255,255,255,0.2)'}
        >
          Reset
        </button>
        <button
          onClick={() => setCount(count + 1)}
          style={{
            padding: '0.75rem 1.5rem',
            fontSize: '1rem',
            background: 'rgba(255,255,255,0.2)',
            border: '2px solid white',
            borderRadius: '6px',
            color: 'white',
            cursor: 'pointer',
            fontWeight: 'bold',
            transition: 'all 0.2s'
          }}
          onMouseOver={(e) => e.currentTarget.style.background = 'rgba(255,255,255,0.3)'}
          onMouseOut={(e) => e.currentTarget.style.background = 'rgba(255,255,255,0.2)'}
        >
          +
        </button>
      </div>
      <p style={{ marginTop: '1rem', fontSize: '0.875rem', opacity: 0.9 }}>
        ✨ Hydrates immediately with client:load
      </p>
    </div>
  );
}
