import { BrowserRouter, Routes, Route } from 'react-router-dom';

function Home() {
  return (
    <div className="min-h-screen bg-background text-foreground flex flex-col items-center justify-center p-10 font-sans">
      <div className="text-center max-w-2xl">
        <h1 className="text-5xl font-extrabold mb-6 tracking-tight">
          Template Ready
        </h1>
        <p className="text-xl text-muted-foreground mb-8">
          This is a clean, empty Spring Boot and React template. Replace this page to start building your application.
        </p>
      </div>
    </div>
  );
}

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home />} />
        {/* Add more routes here, Spring Boot will correctly forward deep links to React Router */}
        <Route path="*" element={<Home />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
