# Define basic factory for a phone and card record

  Factory.define :card do |c|
    c.name "unassigned so far"
  end
  
  Factory.define :phone do |p|
    p.number "617-555-1212"
  end
  
