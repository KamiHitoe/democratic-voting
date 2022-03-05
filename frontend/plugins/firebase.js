import firebase from 'firebase/compat/app';
import 'firebase/compat/auth';
// import "firebase/compat/firestore";
// import "firebase/compat/storage";

const firebaseConfig = {
  apiKey: process.env.FIREBASE_API_KEY,
  authDomain: "democratic-voting.firebaseapp.com",
  projectId: "democratic-voting",
  storageBucket: "democratic-voting.appspot.com",
  messagingSenderId: "189243754320",
  appId: "1:189243754320:web:acc382070d38c316f0ce55",
  measurementId: "G-1E1F7HHMG4"
};

// Initialize Firebase
firebase.initializeApp(firebaseConfig);

export default firebase;