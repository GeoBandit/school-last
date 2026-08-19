export interface Person {
  name: string;
  age: number;
}

export const data: Person[] = [
  { name: "giorgi", age: 12 },
  { name: "paata", age: 11 },
  { name: "lali", age: 34 },
  { name: "gurami", age: 30 },
];

// -----------------------------------------------------
interface Answer {
  text: string;
  isCorrect: boolean;
}

export interface Question {
  image: string;
  desc: string;
  _id: number;
  gadjet: string;
  answeringQuestion: string;
  answers: Answer[];
}

export interface VehicleCategory {
  id: string;
  label: string;
  icon: string;
  gadjet: string;
  categoryMappings: {
    [categoryName: string]: {
      questions: Question[];
    };
  };
}

export interface Category {
  id: number;
  name: string;
}

export interface ActiveCategory {
  id: number;
  name: string;
  tickets: number;
  main: Question[];
}

export const vehicleCategories: VehicleCategory[] = [
  ];

export const questionCategories: Category[] = [
  { id: 1, name: "1. მძღოლი, მგზავრი და ქვეითი" },
  { id: 2, name: "2. უწესრიგობა და მართვის პირობები" },
  { id: 3, name: "3. გამაფრთხილებელი ნიშნები", },
  { id: 4, name: "4. პრიორიტეტის ნიშნები", },
  { id: 5, name: "5. ამკრძალავი ნიშნები" },
  { id: 6, name: "6. მიმთითებელი ნიშნები" },
  { id: 7, name: "7. საინფორმაციო მაჩვენებელი ნიშნები" },
  { id: 8, name: "8. სერვისის ნიშნები" },
  { id: 9, name: "9. დამატებითი ინფორმაციის ნიშნები" },
  { id: 10, name: "10. შუქნიშნის ნიშნები" },
  { id: 11, name: "11. მარეგულირებლის სიგნალები" },
  { id: 12, name: "12. სპეციალური სიგნალის გამოყენება" },
  { id: 13, name: "13. საავარიო შუქური სიგნალიზაცია", },
  { id: 14, name: "14. სანათი ხელსაწყოები, ხმოვანი სიგნალი" },
  { id: 15, name: "15. მოძრაობა, მანევრირება, სავალი ნაწილი" },
  { id: 16, name: "16. გასწრება შემხვედრის გვერდის ავლით" },
  { id: 17, name: "17. მოძრაობის სიჩქარე" },
  { id: 18, name: "18. სამუხრუჭე მანძილი, დისტანცია" },
  { id: 19, name: "19. გაჩერება დგომა" },
  { id: 20, name: "20. გზაჯვარედინის გავლა" },
  { id: 21, name: "21. რკინიგზის გადასასვლელი" },
  { id: 22, name: "22. მოძრაობა ავტომაგისტრალზე" },
  { id: 23, name: "23. საცხოვრებელი ზონა, სამარშრუტოს პრიორიტეტი" },
  { id: 24, name: "24. ბუქსირება" },
  { id: 25, name: "25. სასწავლო სვლა" },
  { id: 26, name: "26. გადაზიდვები, ხალხი, ტვირთი" },
  { id: 27, name: "27. ველოსიპედი, მოპედი და პირუტყვის გადარეკვა" },
  { id: 28, name: "28. საგზაო მონიშვნა" },
  { id: 29, name: "29. სამედიცინო დახმარება" },
  { id: 30, name: "30. მოძრაობის უსაფრთხოება" },
  { id: 31, name: "31. ადმინისტრაციული კანონი" },
  { id: 32, name: "32. ეკო-მართვა" }
];




