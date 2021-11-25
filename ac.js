import yargs from 'yargs';
import fetch from 'node-fetch';
import ac from 'autocannon';

const cliArgs = yargs(process.argv.slice(2))
  .usage('Usage: $0 [-u username] [-p password]')
  .describe('u', 'Optional username - if supplied, authentication is implied')
  .describe('p', 'Optional password')
  .argv;

debugger;

const config = {
  baseUrl: 'https://api.fathomtech.io',
  directUrl: 'https://vr41w3f3n8.execute-api.eu-west-1.amazonaws.com',
  username: cliArgs.u,
  password: cliArgs.p,
  path: 'default/middyTest',
  method: 'POST',
  body: { key1: 'value1', key2: 'value2' },
  connections: 10,
  duration: 1
};


async function authenticate() {
  console.log("Call authenticate");
  result = await fetch(`${config.baseUrl}/authenticate`, {
    method: 'POST',
    body: `{"username": ${config.username}, "password": ${config.password}}`,
    headers: {'content-type': 'application/json'},
  });
  const data = response.json();
  return data.idToken;
}

async function main() {
  const url = `${config.directUrl}/${config.path}`;

  try {
    let idToken;
    if(cliArgs.u) {
      idToken = await authenticate();
    }

    const result = await ac({
      url,
      method: config.method,
      body: JSON.stringify(config.body),
      headers: { 'content-type': 'application/json', authorization: idToken },
      connections: config.connections,
      duration: config.duration,
    });
    //    console.log(result)
    const output = ac.printResult(result, {});
    console.log(output);
  } catch(err) {
    console.log(`An error occurred ${err})`);
    process.exit(1);
  }
}

main();
