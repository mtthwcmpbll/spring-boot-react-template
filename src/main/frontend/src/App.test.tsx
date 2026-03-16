import { describe, it, expect } from 'vitest';
import { render, screen } from '@testing-library/react';
import App from './App';

describe('App component', () => {
  it('should render the Template Ready heading', () => {
    render(<App />);
    const heading = screen.getAllByRole('heading', { level: 1 })[0];
    expect(heading.textContent).toBe('Template Ready');
  });

  it('should render the description text', () => {
    render(<App />);
    const description = screen.getAllByText(/This is a clean, empty Spring Boot and React template/i)[0];
    expect(description).toBeDefined();
  });
});
