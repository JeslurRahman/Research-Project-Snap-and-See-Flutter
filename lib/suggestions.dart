import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Suggestions extends StatefulWidget {
  final String suggest;
  final int timeTaken;
  const Suggestions(
      {super.key, required this.suggest, required this.timeTaken});

  @override
  State<Suggestions> createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  String SuggestBeginer = '''
  Competency 6:  Reads a simple sentence and orally answers the questions asked.

Anticipatory Boundary: Listening to a simple sentence and answering two questions to determine if he understood its meaning.

Appropriate time to start implementation of assessment: From first term of second grade.

Preparation in advance:
Prepare a few sentences that express specific ideas and ask two questions based on each sentence. 
Prepare two questions for each sentence to assess whether the meaning was understood.
Procedure:
Call each student individually.
Provide each student a unique sentence.
Instruct the students to read the sentence with correct pronunciation.
Ask two questions to each student based on the sentence.
Ensure that each student receives a different sentence and avoid repetition.

Consider the criteria for determining proficiency and determine whether the desired proficiency level has been achieved.

If difficulties arise in any of these steps, identify them separately and follow the instructions provided under the guidance.

Criteria for determining proficiency:
Read the two simple sentences presented with the correct pronunciation and provide the correct answers to all four questions asked.

Guidance for students who have not reached the desired proficiency level: 
Identify the unique situation and learning patterns of each vision-impaired student and organize appropriate activities to help them progress from their current level to mastery. Utilize the following steps, which are suitable for vision-impaired students:

Utilize tactile materials or objects to facilitate understanding and answer questions related to them.
Provide braille sentences with corresponding questions, allowing the student to read and respond using braille.
Present a sentence on a prepared card and read it out with correct pronunciation as the teacher. Allow the student to explore the tactile representation of the sentence.
Provide the student with the opportunity to read the same sentence written in braille.
Ask two questions based on the sentence and have the student answer using braille or verbal communication.
Plan and execute these activities until the desired level of proficiency is achieved, adjusting them to meet the specific needs of vision-impaired students.

Plan and execute these scenarios until the desired proficiency level is reached.

Competency 4: Finds out information by asking questions.

Anticipatory Boundary: In the process of learning, teaching, and engaging in various activities, questions are often asked to gather information and enhance understanding.

Appropriate time to start implementation of assessment: From second term of first grade.

Preparation in advance:
From the first term of the first grade, work to maintain a suitable learning environment in the classroom by questioning the teacher in various learning situations.

Procedure: In the following cases, assess the students' understanding of the information by asking relevant questions. 
In learning and teaching process
In group activities
At times of play
In co-curricular activities
In conversations with teacher

Consider the criteria for determining proficiency and conclude whether the desired level of proficiency has been reached.
If difficulties arise in each of these steps, identify them separately and follow the instructions given under the guidance.

Criteria for determining proficiency: Feel free to ask questions whenever necessary to find ot information.

Guidance for students who have not reached the desired proficiency level: 
Identify the unique characteristics and learning patterns of each student. Organize suitable activities accordingly to help each student progress from their current level to the proficiency level. Utilize the following steps as appropriate.

Adopt various methods to motivate such students to ask questions.
Submit interesting stories, friends, items, etc.
Tell a story and create opportunities to ask questions about it.
Display an expressive Items and ask questions about it.
Organize various games based on asking questions.

Plan and execute such scenarios until desired proficiency level is reached.


Competency 3: Recognizes and names something by touch.

Anticipatory Boundary: Identifies and name the given item by touch.

Appropriate time to start implementation of assessment: From second term of first grade 1.

Preparation in advance:
Provide the students with the following types of safe practice.
Eg: Small ball, square eraser, a small bottle.
Use a bag to put them.

Procedure: 
Explain to the student that they will be able to put their hand in a bag containing various items and identify them by touch.
Emphasize that only immediate touch of the material should be used to identify the items.
Provide sufficient time for the student to reach into the bag, feel the items, and identify them.
Name each item aloud after identification, then take it out and show it to the teacher.
Give the student the opportunity to identify each item one by one.

Consider the criteria for determining proficiency and conclude whether the desired level of proficiency has been reached.

If difficulties arise in each of these steps, identify them separately and follow the instructions given under the guidance.


Guidance for students who have not reached the desired proficiency level: 
Consider the unique characteristics and learning patterns of each student. Accordingly, organize suitable activities to help each student progress from their current level to a proficiency level. Use the following steps as appropriate:

Have the students identify four familiar objects by pointing to them and then placing them back in the bag using only their sense of touch. For example, objects like a pencil, pastel, eraser, box, and ruler can be used.

Engage the students in a game where one of the materials is placed behind their hands, and they have to identify it by touch.

Organize tactile recognition games and activities using various materials.

Please note that the revised text includes some minor adjustments for clarity and readability.

Competency 1: Carefully touch and expresses differences.

Expected limit: Touch two substances that are almost similar but have differences. Identify and state five differences between them.

Appropriate time to start the assessment: From the first term of grade 1.

Preparation in advance: 
Prepare the materials mentioned here separately, one for each student.

Procedure: 
Call each student.
Give one set of the materials listed here per student.
Directly touch the relevant materials delicately.
Allow enough time for contact.
Give the opportunity to compare the materials and identify differences.
Ask about the proposed changes.

Consider the criteria for determining proficiency and conclude whether the desired level of proficiency has been reached.
If difficulties arise in each of these steps, identify them specifically and follow the instructions given under the guidance.

Criteria for determining proficiency: Identify five differences and be able to state what each difference is.

Guidance for students who have not reached the desired proficiency level:
Identify each student's unique characteristics and learning patterns. Accordingly, organize appropriate activities to help each student progress from their current level to the proficiency level. Use the following steps as appropriate:
Present different materials for students to touch and provide them with the opportunity to identify the differences.

E.g. 
Two bottles of the same type with a cap and one without a cap.
Two cups of the same type with and without tongs.

Accordingly, gradually develop until identify the differences in a set of relevant materials.
Plan and execute these scenarios until the desired proficiency level is reached.

  ''';

  String SuggestInermediate = '''
  Competency 5 - Counts a lot of substances and discuss the value clearly in numbers.

Anticipatory Boundary: Count any number of items up to 30 and write the value clearly in digits.

Appropriate time to start implementation of assessment: from the second term of the second grade.

Preparation in advance:
Take two bowls.
Take two pots and 30 counters.
Place 30 counters in one container.
Call each student to the teacher.
Ask each student to measure and select a random number of counters between 1 and 5 from the 30 counters.
Give the students an opportunity to recount the remaining counters after the selected ones are removed.
Observe whether the students are counting correctly during the activity.
Ask each student to state the final number of counters left after their selection and recount.

Consider the criteria for determining proficiency and determine whether the desired proficiency level has been achieved.

If difficulties arise in any of these steps, identify them separately and follow the instructions provided under the guidance.


Criteria for determining proficiency:
Accurately count the pile of materials given to the students.
Correctly state the corresponding number name for the counted quantity.
Write the number that corresponds to the quantity of substances counted as a demonstration of proficiency.

Guidance for students who have not reached the desired proficiency level: 
Identify the unique characteristics and learning patterns of each student. Then, organize suitable activities to help each student progress from their current level to proficiency level. Utilize the following steps as appropriate:

Count the materials from 1-5.
Give opportunities to count materials using different times from 1-9, 1-15, 1-20, 1-25, 1-30.

Plan and execute these scenarios until desired proficiency level is reached.


Competency 3: Recognizes and names something by touch.

Anticipatory Boundary: Identifies and name the given item by touch.

Appropriate time to start implementation of assessment: From second term of first grade 1.

Preparation in advance:
Provide the students with the following types of safe practice.
Eg: Small ball, square eraser, a small bottle.
Use a bag to put them.

Procedure: 
Explain to the student that they will be able to put their hand in a bag containing various items and identify them by touch.
Emphasize that only immediate touch of the material should be used to identify the items.
Provide sufficient time for the student to reach into the bag, feel the items, and identify them.
Name each item aloud after identification, then take it out and show it to the teacher.
Give the student the opportunity to identify each item one by one.

Consider the criteria for determining proficiency and conclude whether the desired level of proficiency has been reached.

If difficulties arise in each of these steps, identify them separately and follow the instructions given under the guidance.


Guidance for students who have not reached the desired proficiency level: 
Consider the unique characteristics and learning patterns of each student. Accordingly, organize suitable activities to help each student progress from their current level to a proficiency level. Use the following steps as appropriate:

Have the students identify four familiar objects by pointing to them and then placing them back in the bag using only their sense of touch. For example, objects like a pencil, pastel, eraser, box, and ruler can be used.

Engage the students in a game where one of the materials is placed behind their hands, and they have to identify it by touch.

Organize tactile recognition games and activities using various materials.

Please note that the revised text includes some minor adjustments for clarity and readability.


Competency 1: Carefully touch and expresses differences.

Expected limit: Touch two substances that are almost similar but have differences. Identify and state five differences between them.

Appropriate time to start the assessment: From the first term of grade 1.

Preparation in advance: 
Prepare the materials mentioned here separately, one for each student.

Procedure: 
Call each student.
Give one set of the materials listed here per student.
Directly touch the relevant materials delicately.
Allow enough time for contact.
Give the opportunity to compare the materials and identify differences.
Ask about the proposed changes.

Consider the criteria for determining proficiency and conclude whether the desired level of proficiency has been reached.
If difficulties arise in each of these steps, identify them specifically and follow the instructions given under the guidance.

Criteria for determining proficiency: Identify five differences and be able to state what each difference is.

Guidance for students who have not reached the desired proficiency level:
Identify each student's unique characteristics and learning patterns. Accordingly, organize appropriate activities to help each student progress from their current level to the proficiency level. Use the following steps as appropriate:
Present different materials for students to touch and provide them with the opportunity to identify the differences.

E.g. 
Two bottles of the same type with a cap and one without a cap.
Two cups of the same type with and without tongs.

Accordingly, gradually develop until identify the differences in a set of relevant materials.
Plan and execute these scenarios until the desired proficiency level is reached.

Competency 9: Identifies and names geometric shapes.


Anticipatory Boundary: Circle, triangle Correctly identify geometric shapes like square and rectangle and pronounce their names incorrectly.

Appropriate time to start implementation of assessment: From third term of first grade.

Preparation in advance:
Create physical shapes of a circle, triangle, square, and rectangle using tactile materials. Divide each shape into pieces for further exploration.

Procedure:
Call each student to the teacher.
Present the shapes to each other.
Present the tactile shapes to the students, allowing them to explore through touch.
Encourage students to observe the shapes and ask them to identify the plane of each shape.
Assess proficiency by ensuring that students correctly identify all four shapes and pronounce them accurately.

Consider the criteria for determining proficiency and determine whether the desired proficiency level has been achieved.

If difficulties arise in any of these steps, identify them separately and follow the instructions provided under the guidance.


Criteria for determining proficiency:
The student identifies all four shapes and pronounces them with correct pronunciation.

Guidance for students who have not reached the desired proficiency level: 
Identify the unique characteristics and learning patterns of each student.
Organize appropriate activities to help each student progress from their current level to mastery. Use the following steps as appropriate:

Introduce each shape using tactile representations and provide correct pronunciation.
Create and teach songs associated with the names of the shapes, allowing for singing and tactile exploration.
Utilize puzzle games that involve tactile manipulation of the shape pieces.
Encourage students to verbally name the shapes while creating designs using the shapes.
Use tactile drawing techniques to represent the shapes while verbally saying their names.

For students with pronunciation impairments:
Practice pronouncing different sounds using words such as "wolf," "vasabha," "triroda," "tritva," "krusha," and "straight."
Incorporate pronunciation games to enhance speech skills.
Repeat these words aloud with other children while referring to corresponding tactile pictures.
Mark relevant landforms using tactile representations and appropriate labeling.
Color the drawn shapes while simultaneously saying their names.
Create songs based on the names of the shapes and provide opportunities for students to sing the songs while wearing the corresponding tactile shapes.

Plan and execute these scenarios until the desired proficiency level is reached.

  ''';

  String SuggestPro = '''
  Competency 7:  Describes horizontal and vertical constructions from a set of materials. 

Anticipatory Boundary:  Construct a set of materials and declare the horizontal and verticality of the design.

Appropriate time to start implementation of assessment:  From first term of second grade.

Preparation in advance:
Solid objects such as empty boxes, salmon cans, wooden blocks, etc., are suitable for learning about solidity and sufficiency.

Different shapes made from thick paper, such as circles, triangles, and stars, can also be used for this purpose.

This assessment can be incorporated into the solid objects and shapes lesson series within the mathematics curriculum.

Action Order:
Provide the students with solid objects as needed and give them the opportunity to build independently.

⦁	Observe the student as they engage in constructing. Avoid unnecessary interference.
⦁	Engage in friendly conversation with the student during the activity and inquire about their understanding of vertical and horizontal constructions.
⦁	Ask questions to prompt the student's attention towards verticality and horizontality, such as inquiring why certain objects were placed horizontally and others vertically.
Consider the criteria for determining proficiency and proceed to conclude whetherthe desired level of proficiency has been reached.

If difficulties arise in each of these steps, identify them separately and follow the instructions given under the guidance.

Criteria for determining proficiency:
Reading a given passage with correct pronunciation.

Guidance for students who have not reached the desired proficiency level: 
Thoroughly identify the unique characteristics and learning patterns of each vision-impaired student. Accordingly, organize appropriate activities to help them progress from their current level to the level of proficiency. Utilize the following steps, which are suitable for vision-impaired students:

⦁	Use tactile diagrams or raised-line drawings to represent designs made using shapes.
⦁	Provide materials that allow students to tactually explore and create designs using shapes.
⦁	Introduce solid objects with distinct shapes and provide opportunities for students to construct similar designs using the solid objects.
⦁	Encourage students to build their own designs using a combination of shapes, tactile representations, and solid objects.

Plan and execute these scenarios until desired proficiency level is reached.



Competency 2: Material patterns are touched and recognized to pronounce the material to come next.

Anticipatory Boundary: Recognize and pronounce the image corresponding to the material pattern presented next.

Appropriate time to start implementation of assessment: From second term of first grade 1.

Preparation in advance:
Prepare 5 simple material patterns separately as mentioned here.

Procedure: 
⦁	Call each student to the teacher.
⦁	Present the array of prepared materials to the student one at a time.
⦁	Allow enough time to touch the pattern well.
⦁	Ask what figure should come next according to the pattern.
⦁	In the present the items one at a time and ask for the answer.

Consider the criteria for determining proficiency and conclude whether the desired proficiency level has been reched.

In difficulties arise in each of these steps, identify them separately and follow the instructions given under the guidance.

Criteria for determining proficiency: Correctly stating which item should come next for each of the five-item pattern presented.


Guidance for students who have not reached the desired proficiency level: 
Identify the unique characteristics and learning patterns of each student. Accordingly, organize appropriate activities to support the progress of each student from their current level to a proficiency level. For this purpose, utilize the following strategies as appropriate.

Competency 9: Identifies and names geometric shapes.

Anticipatory Boundary: Circle, triangle Correctly identify geometric shapes like square and rectangle and pronounce their names incorrectly.

Appropriate time to start implementation of assessment: From third term of first grade.

Preparation in advance:
Create physical shapes of a circle, triangle, square, and rectangle using tactile materials. Divide each shape into pieces for further exploration.

Procedure:
⦁	Call each student to the teacher.
⦁	Present the shapes to each other.
⦁	Present the tactile shapes to the students, allowing them to explore through touch.
⦁	Encourage students to observe the shapes and ask them to identify the plane of each shape.
⦁	Assess proficiency by ensuring that students correctly identify all four shapes and pronounce them accurately.

Consider the criteria for determining proficiency and determine whether the desired proficiency level has been achieved.

If difficulties arise in any of these steps, identify them separately and follow the instructions provided under the guidance.


Criteria for determining proficiency:
The student identifies all four shapes and pronounces them with correct pronunciation.

Guidance for students who have not reached the desired proficiency level: 
Identify the unique characteristics and learning patterns of each student.
Organize appropriate activities to help each student progress from their current level to mastery. Use the following steps as appropriate:

⦁	Introduce each shape using tactile representations and provide correct pronunciation.
⦁	Create and teach songs associated with the names of the shapes, allowing for singing and tactile exploration.
⦁	Utilize puzzle games that involve tactile manipulation of the shape pieces.
⦁	Encourage students to verbally name the shapes while creating designs using the shapes.
⦁	Use tactile drawing techniques to represent the shapes while verbally saying their names.

For students with pronunciation impairments:
⦁	Practice pronouncing different sounds using words such as "wolf," "vasabha," "triroda," "tritva," "krusha," and "straight."
⦁	Incorporate pronunciation games to enhance speech skills.
⦁	Repeat these words aloud with other children while referring to corresponding tactile pictures.
⦁	Mark relevant landforms using tactile representations and appropriate labeling.
⦁	Color the drawn shapes while simultaneously saying their names.
⦁	Create songs based on the names of the shapes and provide opportunities for students to sing the songs while wearing the corresponding tactile shapes.

Plan and execute these scenarios until the desired proficiency level is reached.

  ''';

  String SuggestBeginner1 = '''
      Reads a simple sentence and orally answers the questions asked.

Anticipatory Boundary: Listening to a simple sentence and answering two questions to determine if he understood its meaning.

Appropriate time to start implementation of assessment: From first term of second grade.

Preparation in advance:
Prepare a few sentences that express specific ideas and ask two questions based on each sentence. 
Prepare two questions for each sentence to assess whether the meaning was understood.
Procedure:
      Call each student individually.
      Provide each student a unique sentence.
      Instruct the students to read the sentence with correct pronunciation.
      Ask two questions to each student based on the sentence.
      Ensure that each student receives a different sentence and avoid repetition.
      
Consider the criteria for determining proficiency and determine whether the desired proficiency level has been achieved.

If difficulties arise in any of these steps, identify them separately and follow the instructions provided under the guidance.

Criteria for determining proficiency:
Read the two simple sentences presented with the correct pronunciation and provide the correct answers to all four questions asked.

Guidance for students who have not reached the desired proficiency level: 
Identify the unique situation and learning patterns of each vision-impaired student and organize appropriate activities to help them progress from their current level to mastery. Utilize the following steps, which are suitable for vision-impaired students:

Utilize tactile materials or objects to facilitate understanding and answer questions related to them.
Provide braille sentences with corresponding questions, allowing the student to read and respond using braille.
Present a sentence on a prepared card and read it out with correct pronunciation as the teacher. Allow the student to explore the tactile representation of the sentence.
Provide the student with the opportunity to read the same sentence written in braille.
Ask two questions based on the sentence and have the student answer using braille or verbal communication.
Plan and execute these activities until the desired level of proficiency is achieved, adjusting them to meet the specific needs of vision-impaired students.

Plan and execute these scenarios until the desired proficiency level is reached
      ''';

  String SuggestBeginner2 = '''
      Finds out information by asking questions.

Anticipatory Boundary: In the process of learning, teaching, and engaging in various activities, questions are often asked to gather information and enhance understanding.

Appropriate time to start implementation of assessment: From second term of first grade.

Preparation in advance:
From the first term of the first grade, work to maintain a suitable learning environment in the classroom by questioning the teacher in various learning situations.

Procedure: In the following cases, assess the students' understanding of the information by asking relevant questions. 
        In learning and teaching process
        In group activities
        At times of play
        In co-curricular activities
        In conversations with teacher

Consider the criteria for determining proficiency and conclude whether the desired level of proficiency has been reached.
If difficulties arise in each of these steps, identify them separately and follow the instructions given under the guidance.

Criteria for determining proficiency: Feel free to ask questions whenever necessary to find ot information.


Guidance for students who have not reached the desired proficiency level: 
Identify the unique characteristics and learning patterns of each student. Organize suitable activities accordingly to help each student progress from their current level to the proficiency level. Utilize the following steps as appropriate.

Adopt various methods to motivate such students to ask questions.
Submit interesting stories, friends, items, etc.
Tell a story and create opportunities to ask questions about it.
Display an expressive Items and ask questions about it.
Organize various games based on asking questions.

Plan and execute such scenarios until desired proficiency level is reached.

      ''';

  String SuggestBeginner3 = '''
  Recognizes and names something by touch.

Anticipatory Boundary: Identifies and name the given item by touch.

Appropriate time to start implementation of assessment: From second term of first grade 1.

Preparation in advance:
Provide the students with the following types of safe practice.
Eg: Small ball, square eraser, a small bottle.
Use a bag to put them.

Procedure: 
        Explain to the student that they will be able to put their hand in a bag containing various items and identify them by touch.
        Emphasize that only immediate touch of the material should be used to identify the items.
        Provide sufficient time for the student to reach into the bag, feel the items, and identify them.
        Name each item aloud after identification, then take it out and show it to the teacher.
        Give the student the opportunity to identify each item one by one.

Consider the criteria for determining proficiency and conclude whether the desired level of proficiency has been reached.

If difficulties arise in each of these steps, identify them separately and follow the instructions given under the guidance.

Guidance for students who have not reached the desired proficiency level: 
Consider the unique characteristics and learning patterns of each student. Accordingly, organize suitable activities to help each student progress from their current level to a proficiency level. Use the following steps as appropriate:

Have the students identify four familiar objects by pointing to them and then placing them back in the bag using only their sense of touch. For example, objects like a pencil, pastel, eraser, box, and ruler can be used.

Engage the students in a game where one of the materials is placed behind their hands, and they have to identify it by touch.

Organize tactile recognition games and activities using various materials.

Please note that the revised text includes some minor adjustments for clarity and readability.

  ''';

  String SuggestBeginner4 = '''
  Carefully touch and expresses differences.

Expected limit: Touch two substances that are almost similar but have differences. Identify and state five differences between them.

Appropriate time to start the assessment: From the first term of grade 1.

Preparation in advance: 
Prepare the materials mentioned here separately, one for each student.

Procedure: 
        Call each student.
        Give one set of the materials listed here per student.
        Directly touch the relevant materials delicately.
        Allow enough time for contact.
        Give the opportunity to compare the materials and identify differences.
        Ask about the proposed changes.

Consider the criteria for determining proficiency and conclude whether the desired level of proficiency has been reached.
If difficulties arise in each of these steps, identify them specifically and follow the instructions given under the guidance.

Criteria for determining proficiency: Identify five differences and be able to state what each difference is.

Guidance for students who have not reached the desired proficiency level:
Identify each student's unique characteristics and learning patterns. Accordingly, organize appropriate activities to help each student progress from their current level to the proficiency level. Use the following steps as appropriate:
Present different materials for students to touch and provide them with the opportunity to identify the differences.

E.g. 
Two bottles of the same type with a cap and one without a cap.
Two cups of the same type with and without tongs.

Accordingly, gradually develop until identify the differences in a set of relevant materials.
Plan and execute these scenarios until the desired proficiency level is reached.

  ''';

  String SuggestInermediate1 = '''
  Counts a lot of substances and discuss the value clearly in numbers.

Anticipatory Boundary: Count any number of items up to 30 and write the value clearly in digits.

Appropriate time to start implementation of assessment: from the second term of the second grade.

Preparation in advance:
        Take two bowls.
        Take two pots and 30 counters.
        Place 30 counters in one container.
        Call each student to the teacher.
        Ask each student to measure and select a random number of counters between 1 and 5 from the 30 counters.
        Give the students an opportunity to recount the remaining counters after the selected ones are removed.
        Observe whether the students are counting correctly during the activity.
        Ask each student to state the final number of counters left after their selection and recount.

Consider the criteria for determining proficiency and determine whether the desired proficiency level has been achieved.

If difficulties arise in any of these steps, identify them separately and follow the instructions provided under the guidance.

Criteria for determining proficiency:
Accurately count the pile of materials given to the students.
Correctly state the corresponding number name for the counted quantity.
Write the number that corresponds to the quantity of substances counted as a demonstration of proficiency.

Guidance for students who have not reached the desired proficiency level: 
Identify the unique characteristics and learning patterns of each student. Then, organize suitable activities to help each student progress from their current level to proficiency level. Utilize the following steps as appropriate:

Count the materials from 1-5.
Give opportunities to count materials using different times from 1-9, 1-15, 1-20, 1-25, 1-30.

Plan and execute these scenarios until desired proficiency level is reached.

  ''';

  String SuggestInermediate2 = '''
  Recognizes and names something by touch.

Anticipatory Boundary: Identifies and name the given item by touch.

Appropriate time to start implementation of assessment: From second term of first grade 1.

Preparation in advance:
Provide the students with the following types of safe practice.
Eg: Small ball, square eraser, a small bottle.
Use a bag to put them.

Procedure: 
        Explain to the student that they will be able to put their hand in a bag containing various items and identify them by touch.
        Emphasize that only immediate touch of the material should be used to identify the items.
        Provide sufficient time for the student to reach into the bag, feel the items, and identify them.
        Name each item aloud after identification, then take it out and show it to the teacher.
        Give the student the opportunity to identify each item one by one.

Consider the criteria for determining proficiency and conclude whether the desired level of proficiency has been reached.

If difficulties arise in each of these steps, identify them separately and follow the instructions given under the guidance.

Guidance for students who have not reached the desired proficiency level: 
Consider the unique characteristics and learning patterns of each student. Accordingly, organize suitable activities to help each student progress from their current level to a proficiency level. Use the following steps as appropriate:

Have the students identify four familiar objects by pointing to them and then placing them back in the bag using only their sense of touch. For example, objects like a pencil, pastel, eraser, box, and ruler can be used.

Engage the students in a game where one of the materials is placed behind their hands, and they have to identify it by touch.

Organize tactile recognition games and activities using various materials.

Please note that the revised text includes some minor adjustments for clarity and readability.

  ''';

  String SuggestInermediate3 = '''
  Carefully touch and expresses differences.

Expected limit: Touch two substances that are almost similar but have differences. Identify and state five differences between them.

Appropriate time to start the assessment: From the first term of grade 1.

Preparation in advance: 
Prepare the materials mentioned here separately, one for each student.

Procedure: 
        Call each student.
        Give one set of the materials listed here per student.
        Directly touch the relevant materials delicately.
        Allow enough time for contact.
        Give the opportunity to compare the materials and identify differences.
        Ask about the proposed changes.

Consider the criteria for determining proficiency and conclude whether the desired level of proficiency has been reached.
If difficulties arise in each of these steps, identify them specifically and follow the instructions given under the guidance.

Criteria for determining proficiency: Identify five differences and be able to state what each difference is.

Guidance for students who have not reached the desired proficiency level:
Identify each student's unique characteristics and learning patterns. Accordingly, organize appropriate activities to help each student progress from their current level to the proficiency level. Use the following steps as appropriate:
Present different materials for students to touch and provide them with the opportunity to identify the differences.

E.g. 
Two bottles of the same type with a cap and one without a cap.
Two cups of the same type with and without tongs.

Accordingly, gradually develop until identify the differences in a set of relevant materials.
Plan and execute these scenarios until the desired proficiency level is reached.
  ''';

  String SuggestInermediate4 = '''
  Identifies and names geometric shapes.

Anticipatory Boundary: Circle, triangle Correctly identify geometric shapes like square and rectangle and pronounce their names incorrectly.

Appropriate time to start implementation of assessment: From third term of first grade.

Preparation in advance:
Create physical shapes of a circle, triangle, square, and rectangle using tactile materials. Divide each shape into pieces for further exploration.

Procedure:
        Call each student to the teacher.
        Present the shapes to each other.
        Present the tactile shapes to the students, allowing them to explore through touch.
        Encourage students to observe the shapes and ask them to identify the plane of each shape.
        Assess proficiency by ensuring that students correctly identify all four shapes and pronounce them accurately.

Consider the criteria for determining proficiency and determine whether the desired proficiency level has been achieved.

If difficulties arise in any of these steps, identify them separately and follow the instructions provided under the guidance.

Criteria for determining proficiency:
The student identifies all four shapes and pronounces them with correct pronunciation.

Guidance for students who have not reached the desired proficiency level: 
Identify the unique characteristics and learning patterns of each student.
Organize appropriate activities to help each student progress from their current level to mastery. Use the following steps as appropriate:

Introduce each shape using tactile representations and provide correct pronunciation.
Create and teach songs associated with the names of the shapes, allowing for singing and tactile exploration.
Utilize puzzle games that involve tactile manipulation of the shape pieces.
Encourage students to verbally name the shapes while creating designs using the shapes.
Use tactile drawing techniques to represent the shapes while verbally saying their names.

For students with pronunciation impairments:
Practice pronouncing different sounds using words such as "wolf," "vasabha," "triroda," "tritva," "krusha," and "straight."
Incorporate pronunciation games to enhance speech skills.
Repeat these words aloud with other children while referring to corresponding tactile pictures.
Mark relevant landforms using tactile representations and appropriate labeling.
Color the drawn shapes while simultaneously saying their names.
Create songs based on the names of the shapes and provide opportunities for students to sing the songs while wearing the corresponding tactile shapes.

Plan and execute these scenarios until the desired proficiency level is reached.
  ''';

  String SuggestFluent1 = '''
  Describes horizontal and vertical constructions from a set of materials. 

Anticipatory Boundary:  Construct a set of materials and declare the horizontal and verticality of the design.

Appropriate time to start implementation of assessment:  From first term of second grade.

Preparation in advance:
Solid objects such as empty boxes, salmon cans, wooden blocks, etc., are suitable for learning about solidity and sufficiency.

Different shapes made from thick paper, such as circles, triangles, and stars, can also be used for this purpose.

This assessment can be incorporated into the solid objects and shapes lesson series within the mathematics curriculum.

Action Order:
Provide the students with solid objects as needed and give them the opportunity to build independently.
⦁	Observe the student as they engage in constructing. Avoid unnecessary interference.
⦁	Engage in friendly conversation with the student during the activity and inquire about their understanding of vertical and horizontal constructions.
⦁	Ask questions to prompt the student's attention towards verticality and horizontality, such as inquiring why certain objects were placed horizontally and others vertically.
Consider the criteria for determining proficiency and proceed to conclude whetherthe desired level of proficiency has been reached.

If difficulties arise in each of these steps, identify them separately and follow the instructions given under the guidance.

Criteria for determining proficiency:
Reading a given passage with correct pronunciation.

Guidance for students who have not reached the desired proficiency level: 
Thoroughly identify the unique characteristics and learning patterns of each vision-impaired student. Accordingly, organize appropriate activities to help them progress from their current level to the level of proficiency. Utilize the following steps, which are suitable for vision-impaired students:

⦁	Use tactile diagrams or raised-line drawings to represent designs made using shapes.
⦁	Provide materials that allow students to tactually explore and create designs using shapes.
⦁	Introduce solid objects with distinct shapes and provide opportunities for students to construct similar designs using the solid objects.
⦁	Encourage students to build their own designs using a combination of shapes, tactile representations, and solid objects.

Plan and execute these scenarios until desired proficiency level is reached.

  ''';

  String SuggestFluent2 = '''
  Material patterns are touched and recognized to pronounce the material to come next.

Anticipatory Boundary: Recognize and pronounce the image corresponding to the material pattern presented next.

Appropriate time to start implementation of assessment: From second term of first grade 1.

Preparation in advance:
Prepare 5 simple material patterns separately as mentioned here.

Procedure: 
  ⦁	Call each student to the teacher.
  ⦁	Present the array of prepared materials to the student one at a time.
  ⦁	Allow enough time to touch the pattern well.
  ⦁	Ask what figure should come next according to the pattern.
  ⦁	In the present the items one at a time and ask for the answer.

Consider the criteria for determining proficiency and conclude whether the desired proficiency level has been reched.

In difficulties arise in each of these steps, identify them separately and follow the instructions given under the guidance.

Criteria for determining proficiency: Correctly stating which item should come next for each of the five-item pattern presented.

Guidance for students who have not reached the desired proficiency level: 
Identify the unique characteristics and learning patterns of each student. Accordingly, organize appropriate activities to support the progress of each student from their current level to a proficiency level. For this purpose, utilize the following strategies as appropriate.
  ''';

  String SuggestFluent3 = '''
  Identifies and names geometric shapes.

Anticipatory Boundary: Circle, triangle Correctly identify geometric shapes like square and rectangle and pronounce their names incorrectly.

Appropriate time to start implementation of assessment: From third term of first grade.

Preparation in advance:
Create physical shapes of a circle, triangle, square, and rectangle using tactile materials. Divide each shape into pieces for further exploration.

Procedure:
        ⦁	Call each student to the teacher.
        ⦁	Present the shapes to each other.
        ⦁	Present the tactile shapes to the students, allowing them to explore through touch.
        ⦁	Encourage students to observe the shapes and ask them to identify the plane of each shape.
        ⦁	Assess proficiency by ensuring that students correctly identify all four shapes and pronounce them accurately.

Consider the criteria for determining proficiency and determine whether the desired proficiency level has been achieved.

If difficulties arise in any of these steps, identify them separately and follow the instructions provided under the guidance.

Criteria for determining proficiency:
The student identifies all four shapes and pronounces them with correct pronunciation.

Guidance for students who have not reached the desired proficiency level: 
Identify the unique characteristics and learning patterns of each student.
Organize appropriate activities to help each student progress from their current level to mastery. Use the following steps as appropriate:

⦁	Introduce each shape using tactile representations and provide correct pronunciation.
⦁	Create and teach songs associated with the names of the shapes, allowing for singing and tactile exploration.
⦁	Utilize puzzle games that involve tactile manipulation of the shape pieces.
⦁	Encourage students to verbally name the shapes while creating designs using the shapes.
⦁	Use tactile drawing techniques to represent the shapes while verbally saying their names.

For students with pronunciation impairments:
⦁	Practice pronouncing different sounds using words such as "wolf," "vasabha," "triroda," "tritva," "krusha," and "straight."
⦁	Incorporate pronunciation games to enhance speech skills.
⦁	Repeat these words aloud with other children while referring to corresponding tactile pictures.
⦁	Mark relevant landforms using tactile representations and appropriate labeling.
⦁	Color the drawn shapes while simultaneously saying their names.
⦁	Create songs based on the names of the shapes and provide opportunities for students to sing the songs while wearing the corresponding tactile shapes.

Plan and execute these scenarios until the desired proficiency level is reached.
  ''';

  late String selectedSuggestionBeginner;
  late String selectedSuggestionInermediate;
  late String selectedSuggestionFluent;

  String getRandomSuggestionFluent() {
    List<String> suggestions = [
      SuggestFluent1,
      SuggestFluent2,
      SuggestFluent3,
    ];
    Random random = Random();
    int index = random.nextInt(suggestions.length);
    return suggestions[index];
  }

  String getRandomSuggestionInermediate() {
    List<String> suggestions = [
      SuggestInermediate1,
      SuggestInermediate2,
      SuggestInermediate3,
      SuggestInermediate4
    ];
    Random random = Random();
    int index = random.nextInt(suggestions.length);
    return suggestions[index];
  }

  String getRandomSuggestion() {
    List<String> suggestions = [
      SuggestBeginner1,
      SuggestBeginner2,
      SuggestBeginner3,
      SuggestBeginner4
    ];
    Random random = Random();
    int index = random.nextInt(suggestions.length);
    return suggestions[index];
  }

  @override
  void initState() {
    super.initState();
    selectedSuggestionBeginner = getRandomSuggestion();
    selectedSuggestionInermediate = getRandomSuggestionInermediate();
    selectedSuggestionFluent = getRandomSuggestionFluent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 51, 105, 255),
        // title: const Text(
        //   "Snap N SEE",
        //   style: TextStyle(color: Colors.white),
        // ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            SizedBox(width: 8),
            const Text(
              "snapNsee",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              color: Color.fromARGB(255, 51, 105, 255),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Suggestion",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Expanded(
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 1.3,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text("Level : " + widget.suggest),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Time Played : " +
                                  widget.timeTaken.toString()),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Suggestion"),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(widget.suggest == "beginner Level"
                                    ? selectedSuggestionBeginner
                                    : widget.suggest == "intermediate Level"
                                        ? selectedSuggestionInermediate
                                        : selectedSuggestionFluent),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // child: Padding(
          //   padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(
          //         "Lvl :" + widget.suggest,
          //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //       ),
          //       SizedBox(
          //         height: 40,
          //       ),
          //       Text(
          //           "Consider the unique characteristics and learning patterns of each student. Accordingly, organize suitable activities to help each student progress from their current level to a proficiency level. Use the following steps as appropriate:"),
          //       SizedBox(
          //         height: 10,
          //       ),
          //       Text(
          //           "Have the students identify four familiar objects by pointing to them and then placing them back in the bag using only their sense of touch. For example, objects like a pencil, pastel, eraser, box, and ruler can be used."),
          //       SizedBox(
          //         height: 10,
          //       ),
          //       Text(
          //           "Engage the students in a game where one of the materials is placed behind their hands, and they have to identify it by touch."),
          //       SizedBox(
          //         height: 10,
          //       ),
          //       Text(
          //           "Organize tactile recognition games and activities using various materials."),
          //       SizedBox(
          //         height: 10,
          //       ),
          //       Text(
          //           "Please note that the revised text includes some minor adjustments for clarity and readability."),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
