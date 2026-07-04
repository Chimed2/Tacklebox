function update --description 'Keeps retrying the system update until it finishes successfully'
    if not string match -q "my system until it finishes" "$argv"
        echo "Usage: update my system until it finishes"
        return 1
    end

    set LOG_FILE "$HOME/system_update_retry.log"
    set ATTEMPT 1
    set DELAY 5

    set -l start_date (date)
    echo "=== Update Session Started: $start_date ===" >>$LOG_FILE
    echo "Starting update loop. Heavy lifting is logged to $LOG_FILE"

    while true
        set -l current_date (date)
        echo "Attempt #$ATTEMPT..." >>$LOG_FILE
        echo "Running update at $current_date..."

        if sudo pacman -Syu --noconfirm
            set -l success_date (date)
            echo "SUCCESS: System updated successfully on Attempt #$ATTEMPT at $success_date." >>$LOG_FILE
            echo "Update finished successfully!"
            break
        else
            set -l fail_date (date)
            echo "FAILURE: Attempt #$ATTEMPT failed at $fail_date." >>$LOG_FILE
            echo "Waiting $DELAY seconds before restarting..." >>$LOG_FILE
            echo "Backing off... Retrying in $DELAY seconds."
            sleep $DELAY

            if test $DELAY -lt 60
                set DELAY (math $DELAY + 5)
            end

            set ATTEMPT (math $ATTEMPT + 1)
        end
    end
end
