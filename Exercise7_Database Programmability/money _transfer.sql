CREATE OR REPLACE PROCEDURE sp_transfer_money(sender_id INT, receiver_id INT, amount NUMERIC(19,4))
AS
    $$
    DECLARE
        current_balance NUMERIC(19,4);
    BEGIN
        SELECT balance INTO current_balance FROM accounts WHERE id = sender_id;
        CALL sp_withdraw_money(sender_id, amount);
        IF current_balance - amount != (SELECT balance FROM accounts WHERE id = sender_id) THEN
            ROLLBACK;
        END IF;
        CALL sp_deposit_money(receiver_id, amount);
    END;
    $$
LANGUAGE plpgsql;
