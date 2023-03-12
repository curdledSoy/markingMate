-- CreateTable
CREATE TABLE "Course" (
    "id" TEXT NOT NULL PRIMARY KEY
);

-- CreateTable
CREATE TABLE "Assignment" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "courseId" TEXT,
    CONSTRAINT "Assignment_courseId_fkey" FOREIGN KEY ("courseId") REFERENCES "Course" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Student" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT,
    "upi" TEXT
);

-- CreateTable
CREATE TABLE "Rubric" (
    "id" TEXT NOT NULL PRIMARY KEY
);

-- CreateTable
CREATE TABLE "LearningOutcome" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "desc" TEXT,
    "rubricID" TEXT,
    CONSTRAINT "LearningOutcome_rubricID_fkey" FOREIGN KEY ("rubricID") REFERENCES "Rubric" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Mark" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "desc" TEXT,
    "points" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "LearningObjective" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "courseId" TEXT,
    "desc" TEXT,
    CONSTRAINT "LearningObjective_courseId_fkey" FOREIGN KEY ("courseId") REFERENCES "Course" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_CourseToStudent" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,
    CONSTRAINT "_CourseToStudent_A_fkey" FOREIGN KEY ("A") REFERENCES "Course" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_CourseToStudent_B_fkey" FOREIGN KEY ("B") REFERENCES "Student" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_LearningObjectiveToLearningOutcome" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,
    CONSTRAINT "_LearningObjectiveToLearningOutcome_A_fkey" FOREIGN KEY ("A") REFERENCES "LearningObjective" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_LearningObjectiveToLearningOutcome_B_fkey" FOREIGN KEY ("B") REFERENCES "LearningOutcome" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "_CourseToStudent_AB_unique" ON "_CourseToStudent"("A", "B");

-- CreateIndex
CREATE INDEX "_CourseToStudent_B_index" ON "_CourseToStudent"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_LearningObjectiveToLearningOutcome_AB_unique" ON "_LearningObjectiveToLearningOutcome"("A", "B");

-- CreateIndex
CREATE INDEX "_LearningObjectiveToLearningOutcome_B_index" ON "_LearningObjectiveToLearningOutcome"("B");
