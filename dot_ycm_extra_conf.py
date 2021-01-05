def Settings(**kwargs):
    if kwargs['language'] == 'rust':
        return {
            'ls': {
                'rust': {
                    'features': ['http2', 'spnego'],
                    'all_targets': False,
                    'wait_to_build': 1500,
                }
            }
        }
