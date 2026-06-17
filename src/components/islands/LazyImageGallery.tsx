import { h } from 'preact';
import { useState } from 'preact/hooks';

const images = [
  { id: 1, url: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400', title: 'Mountain Vista' },
  { id: 2, url: 'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=400', title: 'Forest Trail' },
  { id: 3, url: 'https://images.unsplash.com/photo-1476231790875-be25a3c9c4e8?w=400', title: 'Ocean Sunset' },
  { id: 4, url: 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=400', title: 'Wild Path' },
];

export default function LazyImageGallery() {
  const [selectedImage, setSelectedImage] = useState<number | null>(null);

  return (
    <div style={{ padding: '1.5rem' }}>
      <h3 style={{ marginBottom: '1rem', fontSize: '1.5rem', color: '#059669' }}>
        Lazy-Loaded Image Gallery
      </h3>
      <div style={{
        display: 'grid',
        gridTemplateColumns: 'repeat(auto-fit, minmax(150px, 1fr))',
        gap: '1rem',
        marginBottom: '1rem'
      }}>
        {images.map((img) => (
          <div
            key={img.id}
            onClick={() => setSelectedImage(img.id)}
            style={{
              cursor: 'pointer',
              borderRadius: '8px',
              overflow: 'hidden',
              border: selectedImage === img.id ? '3px solid #059669' : '3px solid transparent',
              transition: 'all 0.2s',
              boxShadow: '0 2px 4px rgba(0,0,0,0.1)'
            }}
          >
            <img
              src={img.url}
              alt={img.title}
              style={{
                width: '100%',
                height: '150px',
                objectFit: 'cover',
                display: 'block'
              }}
            />
          </div>
        ))}
      </div>
      {selectedImage && (
        <div style={{
          padding: '1rem',
          background: '#d1fae5',
          borderRadius: '6px',
          textAlign: 'center'
        }}>
          <p style={{ color: '#065f46', fontWeight: 'bold' }}>
            Selected: {images.find(img => img.id === selectedImage)?.title}
          </p>
        </div>
      )}
      <p style={{ marginTop: '1rem', fontSize: '0.875rem', color: '#059669' }}>
        👁️ Hydrates when scrolled into view with client:visible
      </p>
    </div>
  );
}
