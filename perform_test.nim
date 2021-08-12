import perform

proc main() = 
    var cube_state = stdin.readLine
    
    while true:
        let action_seq: string = stdin.readLine
        cube_state = cube_state.perform(action_seq)
        echo cube_state

when isMainModule:
    main()