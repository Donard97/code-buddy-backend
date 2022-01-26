user = User.create([{ user_name: "Donard"}])

user_details = UserDetail.create(
  full_name: "Donard Golaj", 
  avatar: "string", 
  birthday: "11/11/11", 
  user_id: 1)


  meetings = Meeting.create(
    title: "title",
    description: "description",
    color: "color",
    image: "image",
    link: "link",
    meeting_type_id: 2,
    user_id: 4
  )

  meetings.save