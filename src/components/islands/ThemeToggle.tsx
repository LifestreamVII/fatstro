import { h } from 'preact';
import { useState, useEffect } from 'preact/hooks';

export default function ThemeToggle() {
  const [theme, setTheme] = useState<'light' | 'dark'>('light');

  useEffect(() => {
    // Check system preference or saved preference
    const savedTheme = localStorage.getItem('theme') as 'light' | 'dark' | null;
    const systemPreference = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
    const initialTheme = savedTheme || systemPreference;
    
    setTheme(initialTheme);
    document.documentElement.setAttribute('data-theme', initialTheme);
  }, []);

  const toggleTheme = () => {
    const newTheme = theme === 'light' ? 'dark' : 'light';
    setTheme(newTheme);
    document.documentElement.setAttribute('data-theme', newTheme);
    localStorage.setItem('theme', newTheme);
  };

  return (
    <div style={{
      padding: '1.5rem',
      background: theme === 'light' ? '#fbbf24' : '#1e293b',
      borderRadius: '8px',
      textAlign: 'center',
      transition: 'all 0.3s',
      boxShadow: '0 4px 6px rgba(0,0,0,0.1)'
    }}>
      <h3 style={{ 
        marginBottom: '1rem', 
        fontSize: '1.5rem',
        color: theme === 'light' ? '#78350f' : '#fbbf24'
      }}>
        Theme Toggle
      </h3>
      <div style={{ fontSize: '4rem', marginBottom: '1rem' }}>
        {theme === 'light' ? '☀️' : '🌙'}
      </div>
      <button
        onClick={toggleTheme}
        style={{
          padding: '0.75rem 2rem',
          fontSize: '1rem',
          background: theme === 'light' ? '#78350f' : '#fbbf24',
          color: theme === 'light' ? 'white' : '#78350f',
          border: 'none',
          borderRadius: '6px',
          cursor: 'pointer',
          fontWeight: 'bold',
          transition: 'all 0.2s',
          boxShadow: '0 2px 4px rgba(0,0,0,0.2)'
        }}
      >
        Switch to {theme === 'light' ? 'Dark' : 'Light'} Mode
      </button>
      <p style={{ 
        marginTop: '1rem', 
        fontSize: '0.875rem',
        color: theme === 'light' ? '#78350f' : '#cbd5e1'
      }}>
        🎯 Hydrates based on media query with client:media
      </p>
    </div>
  );
}
