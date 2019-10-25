def playerIcons(poi):
    if poi['id'] == 'Player':
        poi['icon'] = "https://overviewer.org/avatar/%s" % poi['EntityId']
        return "Last known location for %s" % poi['EntityId']

def signFilter(poi):
    if poi['id'] == 'Sign' or poi['id'] == 'minecraft:sign':
        if poi['Text4'] == '-- RENDER --':
            return "\n".join([poi['Text1'], poi['Text2'], poi['Text3']])

worlds['minecraft'] = "/home/minecraft/server/world"
outputdir = "/home/minecraft/render/"

markers = [
    dict(name="Players", filterFunction=playerIcons),
    dict(name="Signs", filterFunction=signFilter)
]

renders['day'] = {
    'world': 'minecraft',
    'title': 'Day',
    'rendermode': 'smooth_lighting',
    'dimension': 'overworld',
    'markers': markers
}

renders['night'] = {
    'world': 'minecraft',
    'title': 'Night',
    'rendermode': 'smooth_night',
    'dimension': 'overworld',
    'markers': markers
}

renders['ender'] = {
    'world': 'minecraft',
    'title': 'Ender',
    'rendermode': 'smooth_lighting',
    'dimension': 'end',
    'markers': markers
}

renders['nether'] = {
    'world': 'minecraft',
    'title': 'Nether',
    'rendermode': 'nether',
    'dimension': 'nether',
    'markers': markers
}
