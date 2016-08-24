
# [EB](http://aws.amazon.com/elasticbeanstalk/) [Docker](https://www.docker.com/) [ReactJS](https://facebook.github.io/react/) [Starter Kit](https://www.reactstarterkit.com)

Example of developing and deploying a [dockerized]((https://www.docker.com/)) [React Starter Kit](https://nodejs.org/) app to [Elastic Beanstalk](http://aws.amazon.com/elasticbeanstalk/)

Requires: Docker, AWS account, [EB cli](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html)

## Local Development Workflow

1. update local repo from remote, e.g. 
	```bash
	git pull origin integration
	```
2. make changes
3. build image & run local app:

	```bash
	$ eb local setenv HOST=http://localhost:3000 PORT=3000
	$ eb local run --port 3000
	```
	
	[more on eb local usage](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb3-local.html)

4. you could alternatively build and run a traditional docker container:
	
	```bash
	$ docker build -t eb-docker-react-starter .
	$ docker run -p 3000:3000 --rm --name eb-docker-react-starter-development -i -t eb-docker-react-starter
	```

5. to test, open browser to `http://localhost:3000`

> [http://localhost:3000/](http://localhost:3000/) — Node.js server (`build/server.js`)<br>
> [http://localhost:3000/graphql](http://localhost:3000/graphql) — GraphQL server and IDE<br>

these are running, but the ports are not yet enabled on the container:

> [http://localhost:3001/](http://localhost:3001/) — BrowserSync proxy with HMR, React Hot Transform<br>
> [http://localhost:3002/](http://localhost:3002/) — BrowserSync control panel (UI)


## EB Deployment

1. create eb app

	```bash
	$ eb init 
	```
	> answer questions on env details

5. create environment for app

	```bash
	$ eb create dev-env-name
	```

## Deploying Updates

1. modify code and test via [Local Development Workflow]
2. commit changes

	```bash
	$ git commit -a -m "my updates"
	```

3. Deploy to eb

	```bash
	$ eb deploy
	```

> NOTE: takes between 3-10 min to deploy changes.  needs optimization.  


## Debugging

inevitably, something will go wrong and you’ll want to gather more information. 

- to fetch logs from your env,

	```bash
	eb logs
	```

- log into your eb environment and look around,

	```bash
	$ eb ssh
	```

- can interact w/ container locally, or on EB host,

	```bash
	# get container name
	$ sudo docker ps
	# connect/attach with an interactive bash session
	$ sudo docker exec -i -t <container name> bash
	```

## React Starter Kit — "[isomorphic](http://nerds.airbnb.com/isomorphic-javascript-future-web-apps/)" web app boilerplate

> [React Starter Kit](https://www.reactstarterkit.com) (RSK) is an opinionated
> boilerplate for web development built on top of [Node.js](https://nodejs.org/),
> [Express](http://expressjs.com/), [GraphQL](http://graphql.org/) and
> [React](https://facebook.github.io/react/), containing modern web development
> tools such as [Webpack](http://webpack.github.io/), [Babel](http://babeljs.io/)
> and [Browsersync](http://www.browsersync.io/). Helping you to stay productive
> following the best practices. A solid starting point for both professionals
> and newcomers to the industry.

### RSK Directory Layout

Before you start, take a moment to see how the project structure looks like:

```
.
├── /build/                     # The folder for compiled output
├── /docs/                      # Documentation files for the project
├── /node_modules/              # 3rd-party libraries and utilities
├── /src/                       # The source code of the application
│   ├── /components/            # React components
│   ├── /content/               # Static pages like About Us, Privacy Policy etc.
│   ├── /core/                  # Core framework and utility functions
│   ├── /data/                  # GraphQL server schema and data models
│   ├── /public/                # Static files which are copied into the /build/public folder
│   ├── /routes/                # Page/screen components along with the routing information
│   ├── /client.js              # Client-side startup script
│   ├── /config.js              # Global application settings
│   └── /server.js              # Server-side startup script
├── /test/                      # Unit and end-to-end tests
├── /tools/                     # Build automation scripts and utilities
│   ├── /lib/                   # Library for utility snippets
│   ├── /build.js               # Builds the project from source to output (build) folder
│   ├── /bundle.js              # Bundles the web resources into package(s) through Webpack
│   ├── /clean.js               # Cleans up the output (build) folder
│   ├── /copy.js                # Copies static files to output (build) folder
│   ├── /deploy.js              # Deploys your web application
│   ├── /run.js                 # Helper function for running build automation tasks
│   ├── /runServer.js           # Launches (or restarts) Node.js server
│   ├── /start.js               # Launches the development web server with "live reload"
│   └── /webpack.config.js      # Configurations for client-side and server-side bundles
└── package.json                # The list of 3rd party libraries and utilities
```

For more information about hacking on RSK, see the [Getting Started with the React Starter Kit](https://github.com/kriasoft/react-starter-kit/blob/master/docs/getting-started.md)

