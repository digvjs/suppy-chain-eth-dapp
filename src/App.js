import React from 'react';
import './App.css';
import HomeComponent from './components/Home';
import Navbar from './components/Navbar';

function App() {
  return (
    <div className="App">
      <Navbar />
      <HomeComponent />
      <footer>
        <div className="footer">
          <h6 className="m-0 text-white">Designed and developed by <a className="text-white" href="https://d4dev.webiqon.com" target="_blank">D4Dev</a>.</h6>
        </div>
      </footer>
    </div>
  );
}

export default App;
