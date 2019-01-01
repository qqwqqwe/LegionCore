/*
 * Copyright (C) 2008-2019 TrinityCore <https://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef DB2Meta_h__
#define DB2Meta_h__

#include "Define.h"

struct TC_COMMON_API DB2Meta
{
    DB2Meta(int32 indexField, uint32 fieldCount, uint32 layoutHash, char const* types, uint8 const* arraySizes, int32 parentIndexField);

    bool HasIndexFieldInData() const;

    // Returns field index for data loaded in our structures (ID field is appended in the front if not present in db2 file data section)
    uint32 GetIndexField() const;

    // Returns size of final loaded structure
    uint32 GetRecordSize() const;

    int32 GetParentIndexFieldOffset() const;

    uint32 GetDbIndexField() const;
    uint32 GetDbFieldCount() const;

    int32 IndexField;
    int32 ParentIndexField;
    uint32 FieldCount;
    uint32 LayoutHash;
    char const* Types;
    uint8 const* ArraySizes;
};

struct TC_COMMON_API DB2FieldMeta
{
    DB2FieldMeta(bool isSigned, DBCFormer type, char const* name);

    bool IsSigned;
    DBCFormer Type;
    char const* Name;
};

#endif // DB2Meta_h__
