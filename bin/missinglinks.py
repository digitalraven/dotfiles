#! /usr/local/bin/python3

import json

def main():
    ''' Creates a list of all the links that Obsidian
    knows about that do not have corresponding files
    yet.

    Written for personal use with no error checking.
    Obsidian's electron anyway, so if it ever opens
    up the chance of writing a plugin to do this
    it'll need done in Javascript rather than a 
    decent language.

    Might as well use fucking PHP...
    '''

    # First, we load the obsidian cache
    with open('.obsidian/cache', 'r') as f:
        source = json.load(f)
    
    # Obsidian uses numerous metadata segments for no
    # good reason, so we need to iterate over all of them
    # Otherwise, this is a typical unique-list-builder
    broken_links = []
    for segment in source['metadata']:
        for link in source['metadata'][segment]['links']:
            if link['link'] not in broken_links:
                broken_links.append(link['link'])

    # Similar unique-list-builder, only we're removing
    # extant links. As the source filenames are the 
    # canonical filename, stripping the '.md.' from files 
    # Obsidian knows about gets us the link name.
    for link in source['files'].keys():
        if link[:-3] in broken_links:
            broken_links.remove(link[:-3])

    if broken_links:
        with open('broken_links.md','w') as f:
            for link in broken_links:
                f.write('* [[{}]]\n'.format(link))
    # Should have an 'else delete' here I guess but if 
    # I ever have a vault with no more links to make
    # then I'm clearly high as goosedick on something

if __name__ == '__main__':
    # TODO: Add some error checking maybe
    main()
