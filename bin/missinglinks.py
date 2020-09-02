#! /usr/local/bin/python3

import os
import re

def find_broken_links() -> []:
    ''' Iterate over all markdown files in a vault; build a list of known files
    and turn the filename into a link -> A, then go through each file and create a list of links
    in those files -> B. Return [B not in A]

    No, we can't use the list of known/unknown links in the vault metadata
    Obsidian's coders are shit.
    '''

    known_links = []
    links = []

    for file in os.listdir(os.getcwd()):
        if file.endswith('.md'):
            link_format = "[["+file[:-3]+"]]"
            known_links.append(link_format)

            with open(file, 'r') as f:
                contents = f.read()

            file_links = re.findall('\[\[.*?\]\]', contents)
            file_links = [re.sub('\|.*', ']]', f) for f in file_links]
            [links.append(f) for f in file_links if f.lower() not in map(str.lower, links)]

    return [l for l in links if l.lower() not in map(str.lower, known_links)]

if __name__ == "__main__":
    broken_links = find_broken_links()
    if broken_links:
<<<<<<< HEAD
        with open('broken_links.md', 'w') as f:
            f.write(str.join('\n', ["* " + l for l in broken_links]))
=======
        with open('broken_links.md','w') as f:
            for link in broken_links:
                f.write('* [[{}]]\n'.format(link))
    # Should have an 'else delete' here I guess but if 
    # I ever have a vault with no more links to make
    # then I'm clearly high as goosedick on something

if __name__ == '__main__':
    # TODO: Add some error checking maybe
    main()
>>>>>>> 869fd5bc534933d2025a79397a4e1627b6b5f66e
