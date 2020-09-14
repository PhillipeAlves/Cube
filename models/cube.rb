# ---------------------GENERIC-----------------------

def run_sql(sql)

    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'cubes'})

    results = db.exec(sql)

    db.close

    return results

end


# ------------------CRUD Methods---------------------


# ----CREATE----


def create_cube(front, side, top)

    run_sql("INSERT into cubes (front, side, top) values ('#{ front }', '#{ side }', '#{ top }');")

end


# ----READ----


def find_all_cubes

    run_sql("SELECT * FROM cubes;")

end

def find_one_cube_by_id(id)

    cubes = run_sql("SELECT * FROM cubes where id = #{id};")

    cubes.first

end


# ----UPDATE----


def update_cube(id, front, side)

    run_sql("UPDATE cubes SET front = '#{ front }', side = '#{ side }', top = '#{ top }' WHERE id = #{ id};")

end


# ----DELETE----


def delete_cube(id)

    run_sql("DELETE FROM cubes WHERE id = #{ id };")

end