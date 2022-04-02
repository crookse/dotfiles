const projects: {[key: string]: string[]} = {
  drashland: [
    "accio",
    "deno-drash-realworld-example-app",
    "dmm",
    "drash",
    "line",
    "moogle",
    "moogle-pro",
    "rhum",
    "services",
    "sinco",
    "unilogger",
    "website-v2",
    "wocket",
  ]
}

const path = Deno.args[0] || "~/src";

let output = `pane	playground	1	1	:*	1	:${path}	0	bash	:\n`;

// Create the panes that go in each window
for (const org in projects) {

  const array: string[] = projects[org];

  array.forEach((project: string) => {
    output += `pane	${org}/${project}	1	1	:*	1	:${path}/${org}/${project}	0	bash	:\n`;
    output += `pane	${org}/${project}	1	1	:*	2	:${path}/${org}/${project}	0	bash	:\n`;
    output += `pane	${org}/${project}	1	1	:*	3	:${path}/${org}/${project}	1	bash	:\n`;
  });
}

// Create the windows
for (const org in projects) {

  const array: string[] = projects[org];

  array.forEach((project: string) => {
    output += `window	${org}/${project}	1	:bash	1	:*	ab74,364x99,0,0{265x99,0,0,2,98x99,266,0[98x49,266,0,3,98x49,266,50,4]}	:\n`;
  });
}

output += `window	playground	1	:bash	1	:*	ab74,364x99,0,0{265x99,0,0,2,98x99,266,0[98x49,266,0,3,98x49,266,50,4]}	:\n`;
output += `state	playground\n`;

Deno.writeFileSync("~/.tmux/resurrect/fresh.txt", new TextEncoder().encode(output));
