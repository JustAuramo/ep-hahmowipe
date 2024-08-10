-- LICENSE ILMAN license: PREFIXIÄ!
SET @id = '';

DELETE FROM `users` WHERE `identifier` = @id COLLATE utf8mb4_unicode_ci;
DELETE FROM `phone_phones` WHERE `owner_id` = @id COLLATE utf8mb4_unicode_ci;
DELETE FROM `okokbilling` WHERE `receiver_identifier` = @id COLLATE utf8mb4_unicode_ci OR `author_identifier` = @id COLLATE utf8mb4_unicode_ci;
DELETE FROM `okokbanking_transactions` WHERE `receiver_identifier` = @id COLLATE utf8mb4_unicode_ci OR `sender_identifier` = @id COLLATE utf8mb4_unicode_ci;
DELETE FROM `outfits` WHERE `identifier` = @id COLLATE utf8mb4_unicode_ci;
DELETE FROM `owned_vehicles` WHERE `owner` = @id COLLATE utf8mb4_unicode_ci;
DELETE FROM `player_houses` WHERE `owner` = @id COLLATE utf8mb4_unicode_ci;
DELETE FROM `selldrugs_players` WHERE `player` = @id COLLATE utf8mb4_unicode_ci;
DELETE FROM `zerio-multijobs` WHERE `identifier` = @id COLLATE utf8mb4_unicode_ci;
DELETE FROM `cs_jobform_user` WHERE `identifier` = @id COLLATE UTF8MB4_UNICODE_CI;
DELETE FROM `addon_account_data` WHERE `owner` = @id COLLATE UTF8MB4_UNICODE_CI;
DELETE FROM `ak4y_advancedhunting` WHERE `citizenid` = @id COLLATE UTF8MB4_UNICODE_CI;
DELETE FROM `casino_players` WHERE `identifier` = @id COLLATE UTF8MB4_UNICODE_CI;
DELETE FROM `datastore_data` WHERE `owner` = @id COLLATE UTF8MB4_UNICODE_CI;
DELETE FROM `eza_taxi` WHERE `cid` = @id COLLATE UTF8MB4_UNICODE_CI;
DELETE FROM `gympass` WHERE `identifier` = @id COLLATE UTF8MB4_UNICODE_CI;
DELETE FROM `gymstats` WHERE `identifier` = @id COLLATE UTF8MB4_UNICODE_CI;
DELETE FROM `k5_documents` WHERE `ownerId` = @id COLLATE UTF8MB4_UNICODE_CI;
DELETE FROM `kq_extra` WHERE `player` = @id COLLATE UTF8MB4_UNICODE_CI;
DELETE FROM `metal_detecting` WHERE `player_identifier` = @id COLLATE UTF8MB4_UNICODE_CI;
DELETE FROM `rcore_tattoos` WHERE `identifier` = @id COLLATE UTF8MB4_UNICODE_CI;
DELETE FROM `phone_crypto` WHERE `id` = @id COLLATE UTF8MB4_UNICODE_CI;


-- MDT Incidents PLAYERS
UPDATE `mdt_incidents`
SET players = (
    SELECT CONCAT('[', GROUP_CONCAT(
        IF(JSON_UNQUOTE(value) != @id, JSON_QUOTE(JSON_UNQUOTE(value)), NULL)
        SEPARATOR ','
    ), ']')
    FROM JSON_TABLE(
        CONCAT('[', players, ']'),
        '$[*]' COLUMNS(
            idx FOR ORDINALITY,
            value TEXT PATH '$'
        )
    ) AS json_data
    WHERE JSON_UNQUOTE(value) != @id
)
WHERE players LIKE CONCAT('%', @id, '%');

-- MDT Incidents COPS
UPDATE `mdt_incidents`
SET cops = (
    SELECT CONCAT('[', GROUP_CONCAT(
        IF(JSON_UNQUOTE(value) != @id, JSON_QUOTE(JSON_UNQUOTE(value)), NULL)
        SEPARATOR ','
    ), ']')
    FROM JSON_TABLE(
        CONCAT('[', cops, ']'),
        '$[*]' COLUMNS(
            idx FOR ORDINALITY,
            value TEXT PATH '$'
        )
    ) AS json_data
    WHERE JSON_UNQUOTE(value) != @id
)
WHERE cops LIKE CONCAT('%', @id, '%');

-- MDT Incidents VICTIMS
UPDATE `mdt_incidents`
SET victims = (
    SELECT CONCAT('[', GROUP_CONCAT(
        IF(JSON_UNQUOTE(value) != @id, JSON_QUOTE(JSON_UNQUOTE(value)), NULL)
        SEPARATOR ','
    ), ']')
    FROM JSON_TABLE(
        CONCAT('[', victims, ']'),
        '$[*]' COLUMNS(
            idx FOR ORDINALITY,
            value TEXT PATH '$'
        )
    ) AS json_data
    WHERE JSON_UNQUOTE(value) != @id
)
WHERE victims LIKE CONCAT('%', @id, '%');

-- MDT Warrants PLAYERS
UPDATE `mdt_warrants`
SET players = (
    SELECT CONCAT('[', GROUP_CONCAT(
        IF(JSON_UNQUOTE(value) != @id, JSON_QUOTE(JSON_UNQUOTE(value)), NULL)
        SEPARATOR ','
    ), ']')
    FROM JSON_TABLE(
        CONCAT('[', players, ']'),
        '$[*]' COLUMNS(
            idx FOR ORDINALITY,
            value TEXT PATH '$'
        )
    ) AS json_data
    WHERE JSON_UNQUOTE(value) != @id
)
WHERE players LIKE CONCAT('%', @id, '%');

-- MDT Evidences PLAYERS
UPDATE `mdt_evidences`
SET players = (
    SELECT CONCAT('[', GROUP_CONCAT(
        IF(JSON_UNQUOTE(value) != @id, JSON_QUOTE(JSON_UNQUOTE(value)), NULL)
        SEPARATOR ','
    ), ']')
    FROM JSON_TABLE(
        CONCAT('[', players, ']'),
        '$[*]' COLUMNS(
            idx FOR ORDINALITY,
            value TEXT PATH '$'
        )
    ) AS json_data
    WHERE JSON_UNQUOTE(value) != @id
)
WHERE players LIKE CONCAT('%', @id, '%');

-- MDT Evidences COPS
UPDATE `mdt_evidences`
SET cops = (
    SELECT CONCAT('[', GROUP_CONCAT(
        IF(JSON_UNQUOTE(value) != @id, JSON_QUOTE(JSON_UNQUOTE(value)), NULL)
        SEPARATOR ','
    ), ']')
    FROM JSON_TABLE(
        CONCAT('[', cops, ']'),
        '$[*]' COLUMNS(
            idx FOR ORDINALITY,
            value TEXT PATH '$'
        )
    ) AS json_data
    WHERE JSON_UNQUOTE(value) != @id
)
WHERE cops LIKE CONCAT('%', @id, '%');