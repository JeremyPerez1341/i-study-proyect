<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="200" alt="Nest Logo" /></a>
</p>

[circleci-image]: https://img.shields.io/circleci/build/github/nestjs/nest/master?token=abc123def456
[circleci-url]: https://circleci.com/gh/nestjs/nest

  <p align="center">A progressive <a href="http://nodejs.org" target="_blank">Node.js</a> framework for building efficient and scalable server-side applications.</p>
    <p align="center">
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/v/@nestjs/core.svg" alt="NPM Version" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/l/@nestjs/core.svg" alt="Package License" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/dm/@nestjs/common.svg" alt="NPM Downloads" /></a>
<a href="https://circleci.com/gh/nestjs/nest" target="_blank"><img src="https://img.shields.io/circleci/build/github/nestjs/nest/master" alt="CircleCI" /></a>
<a href="https://coveralls.io/github/nestjs/nest?branch=master" target="_blank"><img src="https://coveralls.io/repos/github/nestjs/nest/badge.svg?branch=master#9" alt="Coverage" /></a>
<a href="https://discord.gg/G7Qnnhy" target="_blank"><img src="https://img.shields.io/badge/discord-online-brightgreen.svg" alt="Discord"/></a>
<a href="https://opencollective.com/nest#backer" target="_blank"><img src="https://opencollective.com/nest/backers/badge.svg" alt="Backers on Open Collective" /></a>
<a href="https://opencollective.com/nest#sponsor" target="_blank"><img src="https://opencollective.com/nest/sponsors/badge.svg" alt="Sponsors on Open Collective" /></a>
  <a href="https://paypal.me/kamilmysliwiec" target="_blank"><img src="https://img.shields.io/badge/Donate-PayPal-ff3f59.svg"/></a>
    <a href="https://opencollective.com/nest#sponsor"  target="_blank"><img src="https://img.shields.io/badge/Support%20us-Open%20Collective-41B883.svg" alt="Support us"></a>
  <a href="https://twitter.com/nestframework" target="_blank"><img src="https://img.shields.io/twitter/follow/nestframework.svg?style=social&label=Follow"></a>
</p>
  <!--[![Backers on Open Collective](https://opencollective.com/nest/backers/badge.svg)](https://opencollective.com/nest#backer)
  [![Sponsors on Open Collective](https://opencollective.com/nest/sponsors/badge.svg)](https://opencollective.com/nest#sponsor)-->

## Description

[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository.

## Installation

```bash
$ npm install
```

## Create a new app
```
$ nest new istudy
```

## Run app
```
$ npm run start:dev
```

## Test app
- http://localhost:3000

## Install Dependencies
```
$ npm i --save typeorm mysql2 node-sql-reader @nestjs/typeorm @nestjs/cqrs
```

## package.json so far
```
"dependencies": {
    "@nestjs/common": "^9.0.0",
    "@nestjs/core": "^9.0.0",
    "@nestjs/cqrs": "^9.0.1",
    "@nestjs/platform-express": "^9.0.0",
    "@nestjs/typeorm": "^9.0.1",
    "mysql2": "^2.3.3",
    "node-sql-reader": "^0.1.3",
    "reflect-metadata": "^0.1.13",
    "rimraf": "^3.0.2",
    "rxjs": "^7.2.0",
    "typeorm": "^0.3.10"
},
```

## Install Dev Dependencies
```
$ npm i --save-dev npm-run-all
```

## package.json so far
```
"devDependencies": {
    ...,
    "npm-run-all": "^4.1.5",
    ...
  },
```

## Scripts at package.json
Add typeorm command under scripts section in package.json
```
"scripts": {
    ...,
    "typeorm": "typeorm-ts-node-commonjs"
}
```

## Create migrations folder
```
src/shared/infrastructure/persistence/migrations
```

## Setup database connection at app.module.ts file inside imports section
```
imports: [
    TypeOrmModule.forRoot({
      type: "mysql",
      url: 'mysql://root:root@localhost:3306/istudy',
      migrationsRun: true,
      logging: true,
      timezone: '+00:00',
      bigNumberStrings: false,
      entities: [
        'dist/**/infrastructure/persistence/entities/*{.ts,.js}'
      ],
      subscribers: [],
      migrations: [
        'dist/shared/infrastructure/persistence/migrations/*{.ts,.js}'
      ],
      migrationsTableName: "migrations"
    })
],
```
## Import TypeOrmModule package at app.module.ts file
```
import { TypeOrmModule } from '@nestjs/typeorm';
```

## Create Database
```
istudy
```

## Migrations

```
$ npm run typeorm migration:create ./src/shared/infrastructure/persistence/migrations/InitialSchema
$ npm run typeorm migration:create ./src/shared/infrastructure/persistence/migrations/MasterData
```

```
public async up(queryRunner: QueryRunner): Promise<void> {
    const folder = __dirname;
    const path = folder + '/initial-schema.sql';
    let queries = SqlReader.readSqlFile(path);
    for (let query of queries) {
        await queryRunner.query(query);
    }
}
```
## Scripts at package.json
Add the following commands under scripts section in package.json (not include build command)
```
"scripts": {
    ...,
    "copy:package": "node -e \"require('fs').copyFile('./package.json', './dist/package.json', function(err) { if (err) console.log(err); else console.log('package.json copied!') })\"",
    "copy:initial-schema": "node -e \"require('fs').copyFile('src/shared/infrastructure/persistence/migrations/initial-schema.sql', './dist/shared/infrastructure/persistence/migrations/initial-schema.sql', function(err) { if (err) console.log(err); else console.log('initial-schema.sql copied!') })\"",
    "copy:master-data": "node -e \"require('fs').copyFile('src/shared/infrastructure/persistence/migrations/master-data.sql', './dist/shared/infrastructure/persistence/migrations/master-data.sql', function(err) { if (err) console.log(err); else console.log('master-data.sql copied!') })\"",
    "build": "nest build",
    "postbuild": "run-p copy:package copy:initial-schema copy:master-data",
}
```

## Run app in dev mode
```
$ npm run build
$ npm run start:dev
```

## Support

Nest is an MIT-licensed open source project. It can grow thanks to the sponsors and support by the amazing backers. If you'd like to join them, please [read more here](https://docs.nestjs.com/support).

## Stay in touch

- Author - [Kamil Myśliwiec](https://kamilmysliwiec.com)
- Website - [https://nestjs.com](https://nestjs.com/)
- Twitter - [@nestframework](https://twitter.com/nestframework)

## License

Nest is [MIT licensed](LICENSE).
