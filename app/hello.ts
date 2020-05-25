import chalk from 'chalk';

const hello = (message: string) =>
    console.log(chalk`Hello {green ${message}}!`);

export default hello;
