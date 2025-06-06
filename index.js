import Link from "next/link";

export default function Home() {
  return (
    <div style={{textAlign: 'center', marginTop: '50px'}}>
      <h1>Welcome to PDF Viewer App</h1>
      <Link href="/entry-passport">
        <span style={{
          fontSize: '20px',
          color: '#0070f3',
          textDecoration: 'underline',
          cursor: 'pointer'
        }}>
          Go to PDF Viewer
        </span>
      </Link>
    </div>
  );
}