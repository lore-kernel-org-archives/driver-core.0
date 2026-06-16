Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAF22C11D5
	for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 02:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781575848; cv=none; b=JhPVuZ/Ps7SETLnpt59dauZMU8K61vy7d3JRDo8apT8GmoZ2cIehs+tjZjOUFmQeaktH7wNgFPwQ3uGdlwQ/FgZma2kNQSnAutJ/DsQrkBpV0gTqrLE3wcxi67PwGWRlAf30umb6s1etwUASnr8FhtFS6qh4pAxdPpu1MGDU8z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781575848; c=relaxed/simple;
	bh=L6kdnS/oAdXoGfAuCuIQWsLdKlI3bv9EJPPBLfqXNrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QQL/Uq+eTHUejxYPNo5R9PWJLW6lzEJv0fGakya3GJCfBOoRXRkKv+gfxFe2wlQXGdEIg6iigBOGKsKmRyPDnpj+blkDD6tAGVXIWXfvTyPoaYhnUq/JdIafCuR9Ya/IFCj3/BD/i7Qp3NKPTZoiQW7+bb0dc4Hj0qrWSj3lJJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf08.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 741E11C1CDD;
	Tue, 16 Jun 2026 02:10:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf08.hostedemail.com (Postfix) with ESMTPA id 195662002C;
	Tue, 16 Jun 2026 02:10:41 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	driver-core@lists.linux.dev,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	cocci@inria.fr
Subject: [PATCH] coccinelle: Add devm_kmalloc_objs conversion script
Date: Mon, 15 Jun 2026 19:10:39 -0700
Message-ID: <eed0c57a2c897e34d411229c3de41c5402791894.1781575297.git.joe@perches.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Stat-Signature: ezyiduz3r4o6zigfgm3b41bxcdbk4kmm
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 195662002C
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/S7s3uTDrspAEECRY5e3QwscfCVSirI1U=
X-HE-Tag: 1781575841-140553
X-HE-Meta: U2FsdGVkX1/tvojikqxp7bcJdKh2RLorXKPMW6+DRie8nXFD+L92k658r5d2cUcoRGAE4tuxH0yivxRQq8k8SiEMPS+tvRNqRmKSZlmRzCWkI1yjb8ZDtAYZPxNDjo/LiZE4CdXi/0F05mWmgrmq7GYpjcxSoPrYGwNwF0AFi4k2tII7C3tix6ke/WYac5DAizeADiSlPIPWbjUlP628KNsgUEfXcnaKj9LloHpWKTFpkW3A2nwHFDvfVORJ7yBN3eBrc71C7gsp0xeCRL/UCwxpdXYpS6jWLliA8pIW5+0TdqGOY0phTC6pgG0J9IcMhBCNZDykifQ=

Like commit bdc5071d7f7b ("coccinelle: Add kmalloc_objs conversion script")
with commit 1c7bbaeed110 ("coccinelle: kmalloc_obj: Remove default GFP_KERNEL arg")

Finds and converts sized devm_kmalloc-family of allocations into the typed
devm_kmalloc_obj-family of allocations.

Signed-off-by: Joe Perches <joe@perches.com>
---

Maybe this might be useful to run and apply just prior to some -rc1

Lightly tested but directly copied and modified to update the devm_ uses

 .../coccinelle/api/devm_kmalloc_objs.cocci    | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 scripts/coccinelle/api/devm_kmalloc_objs.cocci

diff --git a/scripts/coccinelle/api/devm_kmalloc_objs.cocci b/scripts/coccinelle/api/devm_kmalloc_objs.cocci
new file mode 100644
index 0000000000000..322f79a2d9654
--- /dev/null
+++ b/scripts/coccinelle/api/devm_kmalloc_objs.cocci
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/// Use devm_kmalloc_obj family of macros for allocations
+///
+// Confidence: High
+// Options: --include-headers-for-types --all-includes --include-headers --keep-comments
+
+virtual patch
+
+@initialize:python@
+@@
+import sys
+
+def alloc_array(name):
+	func = "FAILED_RENAME"
+	if name == "devm_kmalloc_array":
+		func = "devm_kmalloc_objs"
+	elif name == "devm_kvmalloc_array":
+		func = "devm_kvmalloc_objs"
+	elif name == "devm_kcalloc":
+		func = "devm_kzalloc_objs"
+	elif name == "devm_kvcalloc":
+		func = "devm_kvzalloc_objs"
+	else:
+		print(f"Unknown transform for {name}", file=sys.stderr)
+	return func
+
+// This excludes anything that is assigning to or from integral types or
+// string literals. Everything else gets the sizeof() extracted for the
+// kmalloc_obj() type/var argument. sizeof(void *) is also excluded because
+// it will need case-by-case double-checking to make sure the right type is
+// being assigned.
+@direct depends on patch && !(file in "tools") && !(file in "samples")@
+typedef u8, u16, u32, u64;
+typedef __u8, __u16, __u32, __u64;
+typedef uint8_t, uint16_t, uint32_t, uint64_t;
+typedef uchar, ushort, uint, ulong;
+typedef __le16, __le32, __le64;
+typedef __be16, __be32, __be64;
+typedef wchar_t;
+type INTEGRAL = {u8,__u8,uint8_t,char,unsigned char,uchar,wchar_t,
+		 u16,__u16,uint16_t,unsigned short,ushort,
+		 u32,__u32,uint32_t,unsigned int,uint,
+		 u64,__u64,uint64_t,unsigned long,ulong,
+		 __le16,__le32,__le64,__be16,__be32,__be64};
+char [] STRING;
+INTEGRAL *BYTES;
+INTEGRAL **BYTES_PTRS;
+type TYPE;
+expression VAR;
+expression GFP;
+expression COUNT;
+expression FLEX;
+expression E;
+expression DEV;
+identifier ALLOC =~ "^devm_kv?[mz]alloc$";
+fresh identifier ALLOC_OBJ = ALLOC ## "_obj";
+fresh identifier ALLOC_FLEX = ALLOC ## "_flex";
+identifier ALLOC_ARRAY = {devm_kmalloc_array,devm_kvmalloc_array,devm_kcalloc,devm_kvcalloc};
+fresh identifier ALLOC_OBJS = script:python(ALLOC_ARRAY) { alloc_array(ALLOC_ARRAY) };
+@@
+
+(
+-	VAR = ALLOC(DEV,(sizeof(*VAR)), GFP)
++	VAR = ALLOC_OBJ(DEV,*VAR, GFP)
+|
+	ALLOC(DEV,(\(sizeof(STRING)\|sizeof(INTEGRAL)\|sizeof(INTEGRAL *)\)), GFP)
+|
+	BYTES = ALLOC(DEV,(sizeof(E)), GFP)
+|
+	BYTES = ALLOC(DEV,(sizeof(TYPE)), GFP)
+|
+	BYTES_PTRS = ALLOC(DEV,(sizeof(E)), GFP)
+|
+	BYTES_PTRS = ALLOC(DEV,(sizeof(TYPE)), GFP)
+|
+	ALLOC(DEV,(sizeof(void *)), GFP)
+|
+-	ALLOC(DEV,(sizeof(E)), GFP)
++	ALLOC_OBJ(DEV, E, GFP)
+|
+-	ALLOC(DEV,(sizeof(TYPE)), GFP)
++	ALLOC_OBJ(DEV,TYPE, GFP)
+|
+	ALLOC_ARRAY(DEV,COUNT, (\(sizeof(STRING)\|sizeof(INTEGRAL)\|sizeof(INTEGRAL *)\)), GFP)
+|
+	BYTES = ALLOC_ARRAY(DEV, COUNT, (sizeof(E)), GFP)
+|
+	BYTES = ALLOC_ARRAY(DEV,COUNT, (sizeof(TYPE)), GFP)
+|
+	BYTES_PTRS = ALLOC_ARRAY(DEV, COUNT, (sizeof(E)), GFP)
+|
+	BYTES_PTRS = ALLOC_ARRAY(DEV, COUNT, (sizeof(TYPE)), GFP)
+|
+	ALLOC_ARRAY(DEV, (\(sizeof(STRING)\|sizeof(INTEGRAL)\|sizeof(INTEGRAL *)\)), COUNT, GFP)
+|
+	BYTES = ALLOC_ARRAY(DEV, (sizeof(E)), COUNT, GFP)
+|
+	BYTES = ALLOC_ARRAY(DEV, (sizeof(TYPE)), COUNT, GFP)
+|
+	BYTES_PTRS = ALLOC_ARRAY(DEV, (sizeof(E)), COUNT, GFP)
+|
+	BYTES_PTRS = ALLOC_ARRAY(DEV, (sizeof(TYPE)), COUNT, GFP)
+|
+	ALLOC_ARRAY(DEV, COUNT, (sizeof(void *)), GFP)
+|
+	ALLOC_ARRAY(DEV, (sizeof(void *)), COUNT, GFP)
+|
+-	ALLOC_ARRAY(DEV, COUNT, (sizeof(E)), GFP)
++	ALLOC_OBJS(DEV, E, COUNT, GFP)
+|
+-	ALLOC_ARRAY(DEV, COUNT, (sizeof(TYPE)), GFP)
++	ALLOC_OBJS(DEV, TYPE, COUNT, GFP)
+|
+-	ALLOC_ARRAY(DEV, (sizeof(E)), COUNT, GFP)
++	ALLOC_OBJS(DEV, E, COUNT, GFP)
+|
+-	ALLOC_ARRAY(DEV, (sizeof(TYPE)), COUNT, GFP)
++	ALLOC_OBJS(DEV, TYPE, COUNT, GFP)
+|
+-	ALLOC(DEV, struct_size(VAR, FLEX, COUNT), GFP)
++	ALLOC_FLEX(DEV, *VAR, FLEX, COUNT, GFP)
+|
+-	ALLOC(DEV, struct_size_t(TYPE, FLEX, COUNT), GFP)
++	ALLOC_FLEX(DEV, TYPE, FLEX, COUNT, GFP)
+)
+
+@drop_gfp_kernel depends on patch && !(file in "tools") && !(file in "samples")@
+identifier ALLOC = {devm_kmalloc_obj,devm_kmalloc_objs,devm_kmalloc_flex,
+		    devm_kzalloc_obj,devm_kzalloc_objs,devm_kzalloc_flex,
+		    devm_kvmalloc_obj,devm_kvmalloc_objs,devm_kvmalloc_flex,
+		    devm_kvzalloc_obj,devm_kvzalloc_objs,devm_kvzalloc_flex};
+@@
+
+	ALLOC(...
+-		 , GFP_KERNEL
+	     )
-- 
2.54.0

