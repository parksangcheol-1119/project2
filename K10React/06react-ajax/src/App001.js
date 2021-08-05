import React, { Component } from 'react';
import './App.css';

class App extends Component {
  render(){
    return (
      <div className="App">
         <h1>WEB</h1>
         <nav>
           <ul>
             <li><a href="1">HTML</a></li>
             <li><a href="2">CSS</a></li>
             <li><a href="3">JavaScript</a></li>
           </ul>
         </nav>
         <article>
           <h2>Welcome</h2>
           Hello, Ajax..!!
         </article>
      </div>
    );
  }
}

export default App;
