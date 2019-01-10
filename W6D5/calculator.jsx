import React from 'react';

class Calculator extends React.Component {
    constructor(props) {
        super(props);
        this.state = { num1: "", num2: "", result: 0 };
        this.setNum1 = this.setNum1.bind(this);
        this.setNum2 = this.setNum2.bind(this);
        this.add = this.add.bind(this);
        this.substract = this.substract(this);
        this.multiply = this.multiply.bind(this);
        this.divide = this.divide.bind(this);
        this.clear = this.clear.bind(this);
    }

    // your code here

    render() {
        return (
            <div>
                <h1>Hello World</h1> 
                <h1>{this.state.result}</h1>
            </div>
        );
    }

    setNum1(e) {
        const num1 = e.target.value ? parseInt(e.target.value) :""; 
        this.setState( { num1 } );
    }

    setNum2(e) {
        const num2 = e.target.value ? parseInt(e.target.value) : ""; 
        this.setState( { num2 } );
    }

    add(e) {
        e.preventDefault();
        const result = this.state.num1 + this.state.num2;
        this.setState({ result });
    }
    
    subtract(e) {
        e.preventDefault();
        const result = this.state.num1 - this.state.num2;
        this.setState({ result });
    }

    multiply(e) {
        e.preventDefault();
        const result = this.state.num1 * this.state.num2;
        this.setState({ result });
    }

    divide(e) {
        e.preventDefault();
        const result = this.state.num1 / this.state.num2;
        this.setState({ result });
    }
}

export default Calculator;