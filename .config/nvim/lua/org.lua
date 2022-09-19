require('orgmode').setup_ts_grammar()
require('orgmode').setup({
    org_todo_keywords = {
        'TODO',
        'PROG',
        'TEST',
        'QUIZ',
        '|',
        'DONE'
    },
    org_agenda_files = { '~/git/agenda/org/*' }
})
