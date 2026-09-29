Received: from mail-dy2-f37.google.com (mail-dy2-f37.google.com [74.125.229.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E4754705E
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 17:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703979; cv=none; b=YN9eIiTwAaJxvUrNR9XSwpFA5FnMdakImUvaDKpHu0S1vba3KBm2/TX8myJroglDeT0zs4Dn90vt2mxZi7ai2dHC/RxPyZUMNffCeI2DZ+yCcJkbRfgGxiDboejL2IWLvdTmCzbCLYkgaNIl1l4dz4rudcMY/A+oG25wc9ABlng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703979; c=relaxed/simple;
	bh=o1FHGacRbJJH7vHCWuq9bvFoqtLARhCCbaNlLlOv/Pc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=blGjfI4nOgnJVZmMevOdiCR9phEg5lF0bBo36LFmjlbhRDG8I8I6pfZGc6Z1M1xBmTsNuqigxOeGX6sNBlcJutegH6alNKuyhAiCviBKTw+rX2h9rLIGOtq9m2iVny4324aJnjaGh/66BmK18VcjSK/2nAP12Drlsqivh/99V+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=M2TzjW11; arc=none smtp.client-ip=74.125.229.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="M2TzjW11"
Received: by mail-dy2-f37.google.com with SMTP id 5a478bee46e88-346c612c7a8so1871182eec.1
        for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 10:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1790703977; x=1791308777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgeDS8BVBQQhIl/1GekJiVq3cnAPaAStPbCRpt0A6es=;
        b=M2TzjW1132UeeybuNRngdBkJ4elOxhpJiyJv6yMPHKM0AcuVnz9tchTvF913KiE85N
         Lp8+3fN+MpF+eF6tWDPv+PH/bM+E5K605KDi3RMxPRH/QlDxKbdY9nLJq1h4Qi3Xukwg
         Cc3VzQhEPykrJK7rJZVQIB+mbvZ1N4cljMbl89HOL8LzRB1vermqkLGw/iYD9pkQfydz
         NuvTMsnHFqhSxt8mUQt2sAPT0PZr+MfMfuzd7Es1rj61Yfah8qS6RpjOat06eu8AZTpi
         RVKxZjSdpsq2Jba4WNiu7dqyf0Masxwz3KW6EdZ9Vz9KLoQxd44px1NYSGL/w6yYivKI
         +ihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703977; x=1791308777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QgeDS8BVBQQhIl/1GekJiVq3cnAPaAStPbCRpt0A6es=;
        b=KpK6TAP25lbbWIUkrefE7Oo+tQgMd78Y24uatrlOFYvojzCijlRD9Qn72/HKwtrxCf
         76AiLNHf+JdHUyNXBdZvuP6su4tjnKGoErXserlWpXExzW/CJNmn6Nfo7EBA5V7yjYtZ
         j0P7FSJ08FCd+hxbBRlPqdgWfTu0iaWTkEfJppiigfIXrnxQNY3t+ABdMPu+iLL/MYoQ
         tKXqB3KWo3oUXq9qtN12ZL+oZeztyWDjE/RXZoSR6nLb9hkHMGew2TvkL1stkr2VgeVt
         +yiIbjCjX7RsP72bFWnMuyrgsrp/2dfk2SBSINvWsd9ybl5JMODhVN/WGH0FkWHjo+BW
         AI3w==
X-Forwarded-Encrypted: i=1; AKwUvBx73gOdO9vPoJBXhW+EAWQ2VuqItFpRp8iC8VcEgFm+s7n15RP42JDKCa5Tn4tefRXOzFSXZgwu+PE5Ag==@lists.linux.dev
X-Gm-Message-State: AFq9FYJblMFZiWFoJ2wy8XfaVOcx5cSMnJkOVCc6ZXPJj7s5u3aPylGJ
	ec1YDcg4pjmjkkbnen8HBLauoWETkp/EQPb8ZH4iVhtoxH1A1GkUW9YwZ/U+v1d2OISyOmSXhdt
	vZsz+B0M=
X-Gm-Gg: AYBFou2Rg11k+M9NerBQInPRoFUaGIiczqdLGWfYUlbppTcvaQio96cRj/cggOaq/U9
	wC7gzB3TEIAedu7yHSb99umjWKSIDKnvoWcSf/CsJD/zdprXfS/Nny0jF8Oa6kQzDSlAaoWarBg
	pQ8ks5NTmkiUiVAv0X0bfFFQke21xv0UyoklbrC4slkFRbJLnHXvY8u+57pGunegD5NlrziA6na
	AyqxKZVekcV9YFffMxBLH328uR+phgPI249u5pn4/KcnEyV+UrnSv86UZMLN2YH2EyabRHDEddL
	y3v3S+dec2zJNGQMuTv9M+Myom14DKaqBvxmC4m2KsAWcrZv+MKBl5vuMrb7yLHmE7gNofr0cE8
	ZJmBZlnRW0qMmN3OG0pcecJLjzy5GU/HriV3NnkmPKiVwjH56W4l+EvQiN/0NCnrA7L6HJAPJPo
	eHV2HlNmkn9k220UQQM8AftPr64GhvBsyMSCuOsgq6kUBWf/4T1RY3GFqGgxdJ5gd5DjxJ25P0I
	JFgAWhgdL/8vYidMxcptOnm1yubd3D/HNg=
X-Received: by 2002:a05:7301:428d:b0:33c:e93:764d with SMTP id 5a478bee46e88-34c644d1084mr73576eec.39.1790703977092;
        Tue, 29 Sep 2026 10:46:17 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-34c32072ee7sm731120eec.0.2026.09.29.10.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:46:16 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	me@kloenk.dev,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 1/1] rust: io: Fix `Region::drop` releasing nested resources from the wrong parent
Date: Tue, 29 Sep 2026 17:46:13 +0000
Message-Id: <a71c5593cfc66e21f24d9c07ae3469fc4f8ea501.1788901318.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1788901318.git.pgovind2@uci.edu>
References: <cover.1788901318.git.pgovind2@uci.edu>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Io resource regions can be requested beneath a specified parent 
resource.
But `Region::drop` does not consider the parent resource.
It releases regions relative to the global resource root.
For nested regions, it may fail to find and release the child region.
This can lead to resource leaks and leaving the name pointer dangling.

Fix this by storing a reference to the parent resource in `Region`.
This ensures that the parent remains valid for the lifetime of the
child region.
The `Region::drop` implementation is updated to use the parent
resource when releasing the region.

Fixes: 493fc33ec252 ("rust: io: add resource abstraction")
Reported-by: Dylan Zueck <dzueck@uci.edu>
Assisted-by: LLM
Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>
---
 rust/kernel/io/mem.rs      |  4 ++--
 rust/kernel/io/resource.rs | 38 ++++++++++++++++++++------------------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
index 32a919099dcd..245d8e1e5e6c 100644
--- a/rust/kernel/io/mem.rs
+++ b/rust/kernel/io/mem.rs
@@ -173,7 +173,7 @@ pub struct ExclusiveIoMem<'a, const SIZE: usize> {
     /// range represented by the underlying `iomem`.
     ///
     /// This field is needed for ownership of the region.
-    _region: Region,
+    _region: Region<'a>,
 }
 
 impl<const SIZE: usize> ForLt for ExclusiveIoMem<'static, SIZE> {
@@ -191,7 +191,7 @@ unsafe impl<const SIZE: usize> CovariantForLt for ExclusiveIoMem<'static, SIZE>
 
 impl<'a, const SIZE: usize> ExclusiveIoMem<'a, SIZE> {
     /// Creates a new `ExclusiveIoMem` instance.
-    fn ioremap(dev: &'a Device<Bound>, resource: &Resource) -> Result<Self> {
+    fn ioremap(dev: &'a Device<Bound>, resource: &'a Resource) -> Result<Self> {
         let start = resource.start();
         let size = resource.size();
         let name = resource.name().unwrap_or_default();
diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
index 17b0c174cfc5..0a94a4eb3e7c 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -27,15 +27,19 @@
 ///
 /// - `self.0` points to a valid `bindings::resource` that was obtained through
 ///   `bindings::__request_region`.
-pub struct Region {
+pub struct Region<'a> {
     /// The resource returned when the region was requested.
     resource: NonNull<bindings::resource>,
+    /// Parent supplied to `__request_region`.
+    /// The reference also prevents a parent `Region` from being dropped
+    /// before this child.
+    parent: &'a Resource,
     /// The name that was passed in when the region was requested. We need to
     /// store it for ownership reasons.
     _name: CString,
 }
 
-impl Deref for Region {
+impl Deref for Region<'_> {
     type Target = Resource;
 
     fn deref(&self) -> &Self::Target {
@@ -44,31 +48,28 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
-impl Drop for Region {
+impl Drop for Region<'_> {
     fn drop(&mut self) {
-        let (flags, start, size) = {
+        let (start, size) = {
             let res = &**self;
-            (res.flags(), res.start(), res.size())
+            (res.start(), res.size())
         };
 
-        let release_fn = if flags.contains(Flags::IORESOURCE_MEM) {
-            bindings::release_mem_region
-        } else {
-            bindings::release_region
-        };
-
-        // SAFETY: Safe as per the invariant of `Region`.
-        unsafe { release_fn(start, size) };
+        // SAFETY:
+        // - `parent` is the resource passed to `__request_region`.
+        // - Its lifetime is tied to this `Region`, so it remains valid.
+        // - `start` and `size` identify the region owned by `self`.
+        unsafe { bindings::__release_region(self.parent.0.get(), start, size) };
     }
 }
 
 // SAFETY: `Region` only holds a pointer to a C `struct resource`, which is safe to be used from
 // any thread.
-unsafe impl Send for Region {}
+unsafe impl Send for Region<'_> {}
 
 // SAFETY: `Region` only holds a pointer to a C `struct resource`, references to which are
 // safe to be used from any thread.
-unsafe impl Sync for Region {}
+unsafe impl Sync for Region<'_> {}
 
 /// A resource abstraction.
 ///
@@ -98,13 +99,13 @@ impl Resource {
     /// Exclusive access will be given and the region will be marked as busy.
     /// Further calls to [`Self::request_region`] will return [`None`] if
     /// the region, or a part of it, is already in use.
-    pub fn request_region(
-        &self,
+    pub fn request_region<'a>(
+        &'a self,
         start: PhysAddr,
         size: ResourceSize,
         name: CString,
         flags: Flags,
-    ) -> Option<Region> {
+    ) -> Option<Region<'a>> {
         // SAFETY:
         // - Safe as per the invariant of `Resource`.
         // - `__request_region` will store a reference to the name, but that is
@@ -122,6 +123,7 @@ pub fn request_region(
 
         Some(Region {
             resource: NonNull::new(region)?,
+            parent: self,
             _name: name,
         })
     }
-- 
2.34.1

