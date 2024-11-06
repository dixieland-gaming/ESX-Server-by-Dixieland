return {
    


    loadNotify = 'Sie müssen die Staatsbürgerschaftsprüfung absolvieren, um spielen zu können!', -- Notification when player loads in without completing citizenship.
    escapeNotify = 'Sie müssen die Staatsbürgerschaftsprüfung absolvieren, um spielen zu können!', -- Notification when player tries to leave citizenship office.

    -- Labels for Exam:
    StartExamLabel = 'Einbürgerungsprüfung starten',
    StartExamHeader = 'Einbürgerungsprüfung',
    StartExamContent = 'Alle neuen Bürger müssen ihre Prüfung bestehen, bevor sie spielen können. Lassen Sie sich Zeit, antworten Sie mit gesundem Menschenverstand und antworten Sie nicht willkürlich.',
    SuccessHeader = 'Sie haben die Einbürgerungsprüfung bestanden!',
    SuccessContent = 'Willkommen auf unserem Server!',    
    FailedHeader = 'Sie haben die Einbürgerungsprüfung nicht bestanden!',
    FailedContent = 'Bitte versuchen Sie es erneut.',

    PassingScore = 4, -- Amount of correct questions required to get citizenship.

    NotifyType = 'ox_lib', -- Support for 'ox_lib', 'qb', 'esx', 'okok' and 'custom' to use a different type.

    interaction = { 
        type = 'target', -- Supports 'marker' and 'target' and '3dtext'

        markerlabel = 'Begin Citizenship Exam',
        markertype = 27, -- https://docs.fivem.net/docs/game-references/markers/
        markercolor = { r = 26, g = 115, b = 179}, -- RGB Color picker: https://g.co/kgs/npUqed1
        markersize = { x = 1.0, y = 1.0, z = 1.0},

        targeticon = 'fas fa-passport', -- https://fontawesome.com/icons
        targetlabel = 'Begin Citizenship Exam',
        targetradius = vector3(4, 4, 4), 
        targerdistance = 2.0,
    },

    -- DO NOT MODIFY UNLESS YOU ARE GOING TO MODIFY citizenZone.
    spawnCoords = vec4(-1371.2579, -471.2089, 72.0422, 6.8564),
    examCoords = vec3(-1372.2820, -465.5251, 71.8305), -- vec3(-1372.2820, -465.5251, 71.8305)
    completionCoords = vec4(-1034.9070, -2733.7327, 20.1693, 331.5052),

    citizenZone = { -- Can be created through /zone box
        coords = vec3(-1372.0, -468.0, 72.0),
        size = vec3(6.5, 29.0, 6.5),
        rotation = 5.0
    },

    
    
    
    Questions = {
        {
            title = 'Was ist Meta-Gaming?',
            allowCancel = false,
            options = {
{label = 'Metagaming ist die Verwendung von Informationen, die Ihr Charakter nicht im Rollenspiel in der Stadt gelernt hat.', correct = true},
{label = 'Metagaming liegt vor, wenn Sie versuchen, Leuten Hühnerfüße zu verkaufen, obwohl Sie keine haben.', correct = false},
{label = 'Ich weiß nicht.', correct = false},
{label = 'Metagaming bedeutet, dass Sie keine Angst mehr um Ihr Leben haben.', correct = false}
            }
        },
        {
            title = 'Was ist Power Gaming?',
            options = {
{label = 'Powergaming ist die Verwendung der Kreditkarte deiner Mutter, um Founders Supporter zu kaufen ;)', correct = false},
{label = 'Powergaming ist die Verwendung unrealistischer Formen des Rollenspiels oder die völlige Weigerung, Rollenspiele zu spielen, um sich selbst einen unfairen Vorteil zu verschaffen.', correct = true},
{label = 'Powergaming ist, wenn du mithilfe von Exploits in das Clubhaus von jemandem einbrichst.', correct = false},
{label = 'Ich weiß nicht.', correct = false}
            }
        },
        {
            title = 'Are you allowed to use third-party cheating software?',
            options = {
{label = 'Ja klar, ich liebe Eulen!', correct = false},
{label = 'Das ist unter keinen Umständen erlaubt.', correct = true},
{label = 'Nur wenn du deine Mama um Erlaubnis gefragt hast.', correct = false},
{label = 'Ich weiß nicht.', correct = false}
            }
        },
        {
            title = 'Welches der folgenden Beispiele ist eine Grüne Zone?',
            allowCancel = false,
            options = {
                {label = 'Krankenhäuser.', correct = true},
                {label = 'Parkbänke.', correct = false},
                {label = 'Überall.', correct = false},
                {label = 'Alles oben genannte', correct = false}
            }
        },
        {
            title = 'Was bedeutet es, aus der Rolle zu fallen?',
            allowCancel = false,
            options = {
 {label = 'Wenn du in der Stadt untypisch redest. ', correct = true},
{label = 'Wenn du den Charakter eines anderen Spielers brichst.', correct = false},
{label = 'Wenn dein Onkel dich nicht von der Schule abholt.', correct = false},
{label = 'Ich weiß nicht.', correct = false}
            }
        },
        {
            title = 'Welches dieser Beispiele stammt aus der Random-Deathmatch-Regel?',
            allowCancel = false,
            options = {
{label = 'Sie dürfen einen anderen Spieler nicht willkürlich angreifen, ohne vorher in irgendeiner Form verbales Rollenspiel zu betreiben.', correct = true},
{label = 'Sie dürfen andere Spieler ohne Grund töten.', correct = false},
{label = 'Sie dürfen kein Wasser kaufen, es sei denn, Sie sind ein Server-Unterstützer.', correct = false},
{label = 'Ich weiß nicht.', correct = false}
            }
        }
    },
    
}