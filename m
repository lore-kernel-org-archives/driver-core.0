Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793529352;
	b=DrcaaCF3PCLFy3Fak2LoQQmYwqg4KQ3Xx8lu0lhiouaafOHdcDl9OGQO5PHq3QFshhzE
	 QEVDLA6g3muiO/ywlGdzhw1WUY04LFELz/dih3W9IWqPHOjJIrTQP65/qmtaUsWIZAcqr
	 c3MUGFXEm5g78FFve7k/7KRr7fo3YjF6auebsMTBIwIfDprqYKL8nisZrj5sqkGVD27pc
	 F1MHxDK2QbKyB6QuZBfEiVffGzx1/DkSZbuWDRz1jn8WGXHmp8pWNy5uJadQI8QpXCtLq
	 3OLfrp/1D+0jbAKubTzyC4ArZ7AjRkphAxE0gptGij3E5ssccQDuvbnw4G4Q62Alp6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793529352;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Stat-Signature:X-Spam-Status:
	 X-Session-Marker:X-Session-ID:X-HE-Tag:X-HE-Meta;
	bh=lr29LKj7jm7xrhBm1kvzir943FoFGYbdRXMWRa/z/8g=;
	b=M1toQYjfFhbWyxzEtv7VEn8SodOe05uycziNKWsiO1+Bt0PSex5LscqrX/LTG3Bia/vf
	 63f59fQKofxYn2nbeqrClW4rTw53OC9pO1IpQ66Uo70e1hmBtksQ2mx+C64HlPftMAHtD
	 ucLMwAtROJsiRTowuEQub9tROqAT030RHf+iEB2s9EiqWwQ4oso2kdb+E54AHeqepfBQO
	 ToQWYO1jicApfahgS9jeR1IoyCHoJ9R5533609pr95mvqL8KKPVuor8gyh48YY6NUOt3t
	 Pgmr82lDq6Z73KBRoCcawOGATCbtcYAKtqrX02VzKiRIlZfDA0/Ql/+jYSspmUxUmow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF42606A324
	for <driver-core@lists.linux.dev>; Sun,  1 Nov 2026 10:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF42606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf15.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 55FB21C4474;
	Sun,  1 Nov 2026 10:35:50 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf15.hostedemail.com (Postfix) with ESMTPA id 020121A;
	Sun,  1 Nov 2026 10:35:47 +0000 (UTC)
Message-ID: <9b55b3e3269ef43ede64fff34f42121f7aa47979.camel@perches.com>
Subject: [resend PATCH] coccinelle: Add devm_kmalloc_objs conversion script
From: Joe Perches <joe@perches.com>
To: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, driver-core@lists.linux.dev, Julia Lawall	
 <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 cocci@inria.fr
Date: Sun, 01 Nov 2026 02:35:46 -0800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 020121A
X-Stat-Signature: wgijqpyekkg9ojk3istbf14hpw4us5qt
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/CuLGSxAJF5y4MHlonP5ikbskV72/ZZM8=
X-HE-Tag: 1793529347-718889
X-HE-Meta: U2FsdGVkX1/yk6OTOzTW8KwYYkxvqFINixk1dvu/iIHmosmBasoCT/OuDz7qkFXOOnrtJHvqrkMzc1tTaKl4rZEdFM1hTRtsVrvecp5/rhBaLVraYV2JW6r8Y3hzkrj/qGO0+xZUS6Zy0mDsBmEIUkI6p6GxiWPLR3L4wXBO5P/OpCpDKBA97a6EvZYzgPvAJhir8v4NckP7mcNCqZMJuUhJuLqi8WIOx9R9gFmVddM0luEm/nWHPHUBozPV6r9WwfdS4StBR3Md/udxLkdX1lZdU0PjS5TbfZjyKMh4qvJ5cx76kp51VGO8mL63fJ40zI6Ai+viegBOhQQwbEgGeoh3qo3pNVOCrP/Ns93C2AuSfkZA/jRAAdusQcWjcyTC

Like commit bdc5071d7f7b ("coccinelle: Add kmalloc_objs conversion script")
with commit 1c7bbaeed110 ("coccinelle: kmalloc_obj: Remove default GFP_KERN=
EL arg")

Finds and converts sized devm_kmalloc-family of allocations into the typed
devm_kmalloc_obj-family of allocations.

Signed-off-by: Joe Perches <joe@perches.com>
---

Maybe this might be useful to run and apply just prior to some -rc1

This script would change more than 8000 instances in more than
5000 files in Linus' current master.

$ spatch -D patch --very-quiet --cocci-file ./scripts/coccinelle/api/devm_k=
malloc_objs.cocci \
    --include-headers-for-types --all-includes --include-headers --keep-com=
ments \
    -I ./arch/x86/include -I ./arch/x86/include/generated -I ./include \
    -I ./arch/x86/include/uapi -I ./arch/x86/include/generated/uapi -I ./in=
clude/uapi \
    -I ./include/generated/uapi --include ./include/linux/compiler-version.=
h \
    --include ./include/linux/kconfig.h .

Lightly tested but directly copied and modified to update the devm_ uses

Its been a bit.
Any comments or negatives about using or running this script?

 .../coccinelle/api/devm_kmalloc_objs.cocci    | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 scripts/coccinelle/api/devm_kmalloc_objs.cocci

diff --git a/scripts/coccinelle/api/devm_kmalloc_objs.cocci b/scripts/cocci=
nelle/api/devm_kmalloc_objs.cocci
new file mode 100644
index 0000000000000..322f79a2d9654
--- /dev/null
+++ b/scripts/coccinelle/api/devm_kmalloc_objs.cocci
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/// Use devm_kmalloc_obj family of macros for allocations
+///
+// Confidence: High
+// Options: --include-headers-for-types --all-includes --include-headers -=
-keep-comments
+
+virtual patch
+
+@initialize:python@
+@@
+import sys
+
+def alloc_array(name):
+	func =3D "FAILED_RENAME"
+	if name =3D=3D "devm_kmalloc_array":
+		func =3D "devm_kmalloc_objs"
+	elif name =3D=3D "devm_kvmalloc_array":
+		func =3D "devm_kvmalloc_objs"
+	elif name =3D=3D "devm_kcalloc":
+		func =3D "devm_kzalloc_objs"
+	elif name =3D=3D "devm_kvcalloc":
+		func =3D "devm_kvzalloc_objs"
+	else:
+		print(f"Unknown transform for {name}", file=3Dsys.stderr)
+	return func
+
+// This excludes anything that is assigning to or from integral types or
+// string literals. Everything else gets the sizeof() extracted for the
+// kmalloc_obj() type/var argument. sizeof(void *) is also excluded becaus=
e
+// it will need case-by-case double-checking to make sure the right type i=
s
+// being assigned.
+@direct depends on patch && !(file in "tools") && !(file in "samples")@
+typedef u8, u16, u32, u64;
+typedef __u8, __u16, __u32, __u64;
+typedef uint8_t, uint16_t, uint32_t, uint64_t;
+typedef uchar, ushort, uint, ulong;
+typedef __le16, __le32, __le64;
+typedef __be16, __be32, __be64;
+typedef wchar_t;
+type INTEGRAL =3D {u8,__u8,uint8_t,char,unsigned char,uchar,wchar_t,
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
+identifier ALLOC =3D~ "^devm_kv?[mz]alloc$";
+fresh identifier ALLOC_OBJ =3D ALLOC ## "_obj";
+fresh identifier ALLOC_FLEX =3D ALLOC ## "_flex";
+identifier ALLOC_ARRAY =3D {devm_kmalloc_array,devm_kvmalloc_array,devm_kc=
alloc,devm_kvcalloc};
+fresh identifier ALLOC_OBJS =3D script:python(ALLOC_ARRAY) { alloc_array(A=
LLOC_ARRAY) };
+@@
+
+(
+-	VAR =3D ALLOC(DEV,(sizeof(*VAR)), GFP)
++	VAR =3D ALLOC_OBJ(DEV,*VAR, GFP)
+|
+	ALLOC(DEV,(\(sizeof(STRING)\|sizeof(INTEGRAL)\|sizeof(INTEGRAL *)\)), GFP=
)
+|
+	BYTES =3D ALLOC(DEV,(sizeof(E)), GFP)
+|
+	BYTES =3D ALLOC(DEV,(sizeof(TYPE)), GFP)
+|
+	BYTES_PTRS =3D ALLOC(DEV,(sizeof(E)), GFP)
+|
+	BYTES_PTRS =3D ALLOC(DEV,(sizeof(TYPE)), GFP)
+|
+	ALLOC(DEV,(sizeof(void *)), GFP)
+|
+-	ALLOC(DEV,(sizeof(E)), GFP)
++	ALLOC_OBJ(DEV, E, GFP)
+|
+-	ALLOC(DEV,(sizeof(TYPE)), GFP)
++	ALLOC_OBJ(DEV,TYPE, GFP)
+|
+	ALLOC_ARRAY(DEV,COUNT, (\(sizeof(STRING)\|sizeof(INTEGRAL)\|sizeof(INTEGR=
AL *)\)), GFP)
+|
+	BYTES =3D ALLOC_ARRAY(DEV, COUNT, (sizeof(E)), GFP)
+|
+	BYTES =3D ALLOC_ARRAY(DEV,COUNT, (sizeof(TYPE)), GFP)
+|
+	BYTES_PTRS =3D ALLOC_ARRAY(DEV, COUNT, (sizeof(E)), GFP)
+|
+	BYTES_PTRS =3D ALLOC_ARRAY(DEV, COUNT, (sizeof(TYPE)), GFP)
+|
+	ALLOC_ARRAY(DEV, (\(sizeof(STRING)\|sizeof(INTEGRAL)\|sizeof(INTEGRAL *)\=
)), COUNT, GFP)
+|
+	BYTES =3D ALLOC_ARRAY(DEV, (sizeof(E)), COUNT, GFP)
+|
+	BYTES =3D ALLOC_ARRAY(DEV, (sizeof(TYPE)), COUNT, GFP)
+|
+	BYTES_PTRS =3D ALLOC_ARRAY(DEV, (sizeof(E)), COUNT, GFP)
+|
+	BYTES_PTRS =3D ALLOC_ARRAY(DEV, (sizeof(TYPE)), COUNT, GFP)
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
+@drop_gfp_kernel depends on patch && !(file in "tools") && !(file in "samp=
les")@
+identifier ALLOC =3D {devm_kmalloc_obj,devm_kmalloc_objs,devm_kmalloc_flex=
,
+		    devm_kzalloc_obj,devm_kzalloc_objs,devm_kzalloc_flex,
+		    devm_kvmalloc_obj,devm_kvmalloc_objs,devm_kvmalloc_flex,
+		    devm_kvzalloc_obj,devm_kvzalloc_objs,devm_kvzalloc_flex};
+@@
+
+	ALLOC(...
+-		 , GFP_KERNEL
+	     )
