Received: from mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1364736F41C
	for <driver-core@lists.linux.dev>; Tue, 18 Aug 2026 19:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787082431; cv=none; b=ffIC8jaOSWzdKdO5N1iRwWoWw9toEJQXGbyj+H8FEBI74IDJj1oTA6EpuIbBAgxFi3qJimsBweDtlzJdmMfUwphz7XF1FN8zRrLtikPUjiyILBrg/vPAmZu5Yk3BpKlG2Id2O0zHVGrUD1OmWdxsZHN80OrDsQfUfHQvy9Y+wFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787082431; c=relaxed/simple;
	bh=Nc/GFa6nG/dUvmdvdNvlEues5ymuc+hKIv0SoCtXy2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aPzJzzd0MY+YYJDqF6xaOvcNvaVXjJGcUYvAK/NIqOv50HcDl1u0FAiPS/Sd0TZsM1ToUDinDacuzk3tFnE7SYmgs/e80Cnkin2ph6xYWkZfrl/c1O4tJOipNqlYLqwVZJVrlPEJxLpdpNRwV5HZT6KMi+qXArhCXzDeotz3pSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AQKHhuSQ; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AQKHhuSQ"
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=Nc/GFa6nG/dUvmdvdNvlEues5ymuc+hKIv0SoCtXy2Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787082427; v=1; x=1787687227;
 b=AQKHhuSQMp8S9rSQd6rgxEeb/MhZtHNjNyeQ51pQ2FqZ8TzibtjiIx9Gxsd5sBjlgtbe6C5R
 kR4aL3ga1psx8CYER3YXpckmLuP+B/zmqqmgVe23qmrSYxp5dPae/43TCcLZr3S2TJP/dCvUC1d
 zo+O0Sc0HFN87yC/+z6RihzM=
X-Envelope-To: driver-core@lists.linux.dev
Received: from savannah.home.local (66.113.51.199)
	by mta12.migadu.com with ESMTPS id 6e0fd7990c50bcc2;
	Tue, 18 Aug 2026 19:47:06 +0000
X-Migadu-Flow: FLOW_OUT
From: Russ Weight <russ.weight@linux.dev>
To: dakr@kernel.org,
	mcgrof@kernel.org
Cc: driver-core@lists.linux.dev,
	Russ Weight <russ.weight@linux.dev>
Subject: [PATCH v1 1/3] firmware_loader: Change contact for sysfs nodes
Date: Tue, 18 Aug 2026 13:46:46 -0600
Message-ID: <20260818194648.1014604-2-russ.weight@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818194648.1014604-1-russ.weight@linux.dev>
References: <20260818194648.1014604-1-russ.weight@linux.dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the contact name for the firmware_loader sysfs nodes to Danilo
Krummrich <dakr@kernel.org>.

Signed-off-by: Russ Weight <russ.weight@linux.dev>
---
 Documentation/ABI/testing/sysfs-class-firmware | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware b/Documentation/ABI/testing/sysfs-class-firmware
index fba87a55f3ca..8bc063950de0 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware
+++ b/Documentation/ABI/testing/sysfs-class-firmware
@@ -1,7 +1,7 @@
 What: 		/sys/class/firmware/.../data
 Date:		July 2022
 KernelVersion:	5.19
-Contact:	Russ Weight <russ.weight@linux.dev>
+Contact:	Danilo Krummrich <dakr@kernel.org>
 Description:	The data sysfs file is used for firmware-fallback and for
 		firmware uploads. Cat a firmware image to this sysfs file
 		after you echo 1 to the loading sysfs file. When the firmware
@@ -13,7 +13,7 @@ Description:	The data sysfs file is used for firmware-fallback and for
 What: 		/sys/class/firmware/.../cancel
 Date:		July 2022
 KernelVersion:	5.19
-Contact:	Russ Weight <russ.weight@linux.dev>
+Contact:	Danilo Krummrich <dakr@kernel.org>
 Description:	Write-only. For firmware uploads, write a "1" to this file to
 		request that the transfer of firmware data to the lower-level
 		device be canceled. This request will be rejected (EBUSY) if
@@ -23,7 +23,7 @@ Description:	Write-only. For firmware uploads, write a "1" to this file to
 What: 		/sys/class/firmware/.../error
 Date:		July 2022
 KernelVersion:	5.19
-Contact:	Russ Weight <russ.weight@linux.dev>
+Contact:	Danilo Krummrich <dakr@kernel.org>
 Description:	Read-only. Returns a string describing a failed firmware
 		upload. This string will be in the form of <STATUS>:<ERROR>,
 		where <STATUS> will be one of the status strings described
@@ -37,7 +37,7 @@ Description:	Read-only. Returns a string describing a failed firmware
 What: 		/sys/class/firmware/.../loading
 Date:		July 2022
 KernelVersion:	5.19
-Contact:	Russ Weight <russ.weight@linux.dev>
+Contact:	Danilo Krummrich <dakr@kernel.org>
 Description:	The loading sysfs file is used for both firmware-fallback and
 		for firmware uploads. Echo 1 onto the loading file to indicate
 		you are writing a firmware file to the data sysfs node. Echo
@@ -49,7 +49,7 @@ Description:	The loading sysfs file is used for both firmware-fallback and
 What: 		/sys/class/firmware/.../remaining_size
 Date:		July 2022
 KernelVersion:	5.19
-Contact:	Russ Weight <russ.weight@linux.dev>
+Contact:	Danilo Krummrich <dakr@kernel.org>
 Description:	Read-only. For firmware upload, this file contains the size
 		of the firmware data that remains to be transferred to the
 		lower-level device driver. The size value is initialized to
@@ -62,7 +62,7 @@ Description:	Read-only. For firmware upload, this file contains the size
 What: 		/sys/class/firmware/.../status
 Date:		July 2022
 KernelVersion:	5.19
-Contact:	Russ Weight <russ.weight@linux.dev>
+Contact:	Danilo Krummrich <dakr@kernel.org>
 Description:	Read-only. Returns a string describing the current status of
 		a firmware upload. The string will be one of the following:
 		idle, "receiving", "preparing", "transferring", "programming".
@@ -70,7 +70,7 @@ Description:	Read-only. Returns a string describing the current status of
 What: 		/sys/class/firmware/.../timeout
 Date:		July 2022
 KernelVersion:	5.19
-Contact:	Russ Weight <russ.weight@linux.dev>
+Contact:	Danilo Krummrich <dakr@kernel.org>
 Description:	This file supports the timeout mechanism for firmware
 		fallback.  This file has no affect on firmware uploads. For
 		more information on timeouts please see the documentation
-- 
2.43.0

