prawn_document(page_layout: :portrait, page_size: "LETTER", margin: 20, bottom_margin: 50) do |pdf|
  # ----------------------------------------------------------------------------
  # TITLE
  # ----------------------------------------------------------------------------
  pdf.font("Helvetica", style: :bold, size: 12) do
    pdf.text "WVU Libraries Phone List (All)"
  end

  pdf.font("Courier", style: :bold, size: 8) do
    pdf.text "Created at #{Time.now.strftime("%B %d, %Y %l:%M %P")}"
  end

  pdf.pad_top(4) { pdf.text "" }
  pdf.stroke_horizontal_rule
  pdf.pad_bottom(8) { pdf.text "" }
  # ----------------------------------------------------------------------------
  # END TITLE
  # ----------------------------------------------------------------------------

  pdf.column_box([0, pdf.cursor], columns: 3, width: pdf.bounds.width) do
    @buildings.each do |building|
    # ----------------------------------------------------------------------------
    # BUILDINGS LIST
    # ----------------------------------------------------------------------------
      pdf.pad(4) do 
        pdf.font("Helvetica", style: :bold, size: 10) do
          pdf.text building.name
        end
        # ----------------------------------------------------------------------------
        # DEPARTMENTS 
        # Skip if no employees in the dept or the department is Faculty Emeriti
        # ----------------------------------------------------------------------------
        building.departments.each do |dept|
          pdf.pad(4) do
            next if dept.name == 'Faculty Emeriti'
            next if dept.employees.count < 1
            pdf.font("Helvetica", style: :bold, size:8) do
              pdf.text dept.name
            end
            # ----------------------------------------------------------------------------
            # EMPLOYEE PHONE NUMBER LIST
            # ----------------------------------------------------------------------------
            pdf.font("Helvetica", size:8) do
              table_array = []
              # ----------------------------------------------------------------------------
              # SERVICE POINTS
              # Service points are names for areas within the department (help desk, etc.)
              # ----------------------------------------------------------------------------
              dept.service_points.each do |sp|
                next if sp.name.nil? || sp.phones.nil?
                sp_name = sp.name 
                sp_phone = sp.phones.pluck(:number).join("\n")
                table_array.push([sp_name, sp_phone])
              end 

              # ----------------------------------------------------------------------------
              # EMPLOYEES
              # This is the employees name, phone number, and leadership role if exists 
              # ----------------------------------------------------------------------------
              dept.employees.each do |employee|
                role = employee.departmentable.where(department_id: dept.id).pluck(:leadership_role).first
                phone_numbers = employee.phones.pluck(:number) unless employee.phones.nil?
                if role == 'member'
                  name = "#{employee.name}"
                else
                  name = "#{employee.name} <i>(#{role})</i>"
                end
                phone = phone_numbers.join("\n")
                table_array.push([name, phone])
              end
              # DRAW THE TABLE 
              table_array = table_array.sort_by(&:first)
              pdf.table(table_array, cell_style: { width:91, padding: 1, inline_format: true}, row_colors: ['FFFFFF', 'EEEEEE']) do
                cells.border_width = 0
                column(0).style align: :left
                column(1).style align: :right
              end
            end
          end
        end

      end
    end
  end 

end