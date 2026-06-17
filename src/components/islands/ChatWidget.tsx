import { h } from 'preact';
import { useState, useEffect, useRef } from 'preact/hooks';

interface Message {
  id: number;
  text: string;
  sender: 'user' | 'bot';
  timestamp: Date;
}

export default function ChatWidget() {
  const [messages, setMessages] = useState<Message[]>([
    { id: 1, text: 'Hi! This component uses client:only because it needs browser APIs.', sender: 'bot', timestamp: new Date() }
  ]);
  const [input, setInput] = useState('');
  const [isOnline, setIsOnline] = useState(true);
  const messagesEndRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    // Browser-only API: navigator.onLine
    setIsOnline(navigator.onLine);

    const handleOnline = () => setIsOnline(true);
    const handleOffline = () => setIsOnline(false);

    window.addEventListener('online', handleOnline);
    window.addEventListener('offline', handleOffline);

    return () => {
      window.removeEventListener('online', handleOnline);
      window.removeEventListener('offline', handleOffline);
    };
  }, []);

  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  }, [messages]);

  const sendMessage = () => {
    if (!input.trim()) return;

    const userMessage: Message = {
      id: messages.length + 1,
      text: input,
      sender: 'user',
      timestamp: new Date()
    };

    setMessages([...messages, userMessage]);
    setInput('');

    // Simulate bot response
    setTimeout(() => {
      const botMessage: Message = {
        id: messages.length + 2,
        text: `You said: "${input}". This widget demonstrates client:only hydration!`,
        sender: 'bot',
        timestamp: new Date()
      };
      setMessages(prev => [...prev, botMessage]);
    }, 1000);
  };

  return (
    <div style={{
      padding: '1.5rem',
      background: 'linear-gradient(135deg, #4facfe 0%, #00f2fe 100%)',
      borderRadius: '8px',
      boxShadow: '0 4px 6px rgba(0,0,0,0.1)'
    }}>
      <div style={{ 
        display: 'flex', 
        justifyContent: 'space-between', 
        alignItems: 'center',
        marginBottom: '1rem'
      }}>
        <h3 style={{ fontSize: '1.5rem', color: 'white', margin: 0 }}>
          Chat Widget
        </h3>
        <span style={{
          padding: '0.25rem 0.75rem',
          background: isOnline ? '#10b981' : '#ef4444',
          color: 'white',
          borderRadius: '9999px',
          fontSize: '0.75rem',
          fontWeight: 'bold'
        }}>
          {isOnline ? '🟢 Online' : '🔴 Offline'}
        </span>
      </div>

      <div style={{
        background: 'white',
        borderRadius: '8px',
        padding: '1rem',
        height: '200px',
        overflowY: 'auto',
        marginBottom: '1rem'
      }}>
        {messages.map(msg => (
          <div
            key={msg.id}
            style={{
              marginBottom: '0.5rem',
              textAlign: msg.sender === 'user' ? 'right' : 'left'
            }}
          >
            <div
              style={{
                display: 'inline-block',
                padding: '0.5rem 1rem',
                borderRadius: '12px',
                background: msg.sender === 'user' ? '#4facfe' : '#e5e7eb',
                color: msg.sender === 'user' ? 'white' : '#1f2937',
                maxWidth: '70%'
              }}
            >
              {msg.text}
            </div>
          </div>
        ))}
        <div ref={messagesEndRef} />
      </div>

      <div style={{ display: 'flex', gap: '0.5rem' }}>
        <input
          type="text"
          value={input}
          onInput={(e) => setInput((e.target as HTMLInputElement).value)}
          onKeyPress={(e) => e.key === 'Enter' && sendMessage()}
          placeholder="Type a message..."
          style={{
            flex: 1,
            padding: '0.75rem',
            border: '2px solid white',
            borderRadius: '6px',
            fontSize: '1rem',
            outline: 'none'
          }}
        />
        <button
          onClick={sendMessage}
          style={{
            padding: '0.75rem 1.5rem',
            background: 'white',
            color: '#4facfe',
            border: 'none',
            borderRadius: '6px',
            fontWeight: 'bold',
            cursor: 'pointer',
            transition: 'all 0.2s'
          }}
        >
          Send
        </button>
      </div>
      <p style={{ marginTop: '1rem', fontSize: '0.875rem', color: 'white', opacity: 0.9 }}>
        🚀 Client-only rendering with client:only="preact"
      </p>
    </div>
  );
}
