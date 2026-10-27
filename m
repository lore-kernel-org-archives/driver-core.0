Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123302;
	b=PGH7jt9bf+xB3xxKoojE878oL2hFX1vPAG3C6rraw6k76kFkaG1LHJ+OakSh1k/bDJHF
	 r78Wg4AzHDFQ2WpjBR0DohZGtdrJb0f20OgiqcgPW40usucr1Fw8nK69+z8OXbYumAMNZ
	 qPra8tsihcu6bl+vxoHKetvtWvBfnoleqALve9XHotL4f3dHVb8aQbYyMpcEiCmagSoli
	 /qd9f78qSsUhXABpheWQ0F6Y+AHlCdXQ0048jeWECPP3Ww/cq3igrfFExy11nvVL1F8Mi
	 X/1/etMeiuOlobqF4XQZdgxP/bYQ0lXWABSD3430RNms1fjWdLKZzaQj+vUq5vEzT/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=coF5c02vssZCkeB6rjzbpbOB68XCpWmc7Y8D46czGV8=;
	b=AfAWIJ0zTVff+1OFc9I806QVoXePS4uBjcxrTrszc8eFr5cxSDO9k4zLFgkX5O/7KSND
	 gTTn4klVPUOv5tQukSTnMRRzxk9GGjO8ycxa9fY+o7qTLwCUeG7JTre9c7rhwZcwVwi5T
	 3lhnCqavkbEuPw00ydzjWCIan68GxFMlCffcP6XETCkN6EIpkMiqQtgWCE5aoJNLQbdHC
	 t4iBZm3YMvs5E6O+5MPIbnY8RG/wwEDBNCEK3H0MfEzgY5Hiodi7AXTNKBkdueZleXo/a
	 ua2n//WCpYqTGyw33kt+b/Epq93+8RCUy2RuMTCaNP4D50+ZV/qryqOrz3nfH1R9t8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uci.edu;
	spf=pass smtp.mailfrom=uci.edu;
	dkim=pass header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=bn5KM5X0;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0954606A31A
	for <driver-core@lists.linux.dev>; Tue, 27 Oct 2026 17:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0954606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=bn5KM5X0
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-18cdcfc05ffso115289c88.1
        for <driver-core@lists.linux.dev>; Tue, 27 Oct 2026 10:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1793123301; x=1793728101; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=coF5c02vssZCkeB6rjzbpbOB68XCpWmc7Y8D46czGV8=;
        b=bn5KM5X0LLdnPndjHGojkBmzcoyDALX91ZnOrnTNSzkf2pb+y4Eml5kziJVJgoerZ9
         6nT89jZ5ixtQlD1t5sG0emaTmilIZnun71N8MePUUTIWjPTS5LhDP1XvnwrQYLohu3Hy
         yP2+frGRDIXM16S+gzeUyfhxCMOptU/WM/oC6iMbph7U/4mX5akkObO+Bsl7R5BJP2Tr
         kAqjUvVdZcX/37t73TsITMlN0Qne5Lz59zMFnsGzLr6qc/L6uxqFEV8btDM0idOGhdyU
         Gdzn5yLVap5/d+cF9/xxzchDkR8/A94vq5IOSh/jfKhl8TZxGzoVXaNDJY/2WrFhaK8s
         Wpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123301; x=1793728101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=coF5c02vssZCkeB6rjzbpbOB68XCpWmc7Y8D46czGV8=;
        b=gCWHX5YgsbXjfrOmy87L4qx7WabKU84gMutr1w0xPwflHjYmvoNrGZo0jTmpfxIcRO
         coeRFPWSO8nZXyN0C/ajHl3JWQWlh1cdAqQ1CNeAMZoj8Tp5wDsE92czTkwXNgiTFKqw
         JDuLGrnYMA1cpNWoIhujf7ZYg8hqrWQXKBBIbdpZbMmaZRBNKvLpLFDG31pTiq2YcGag
         uoi6pw3Fc2zwyqm3gjnygH6LZT8kocI5QRuxnbed35wsb/nbvl2lBP3qqYyYl8CHue3X
         Xo6Z08lfn3jkfs+EQ5ikuYy6ONWvK96cDXTuyJGIRrFeWM72Cvoz6sgr3V8SWKjILBU1
         e4mA==
X-Forwarded-Encrypted: i=1; AKwUvBz7aq6L3Lf7Lq8Gj0Kig7Bj5sq+B9MwJYHtMEUwXZKSKiM3siFMACp8ZshLrQjb51PRJxLWfnzpkg3U9g==@lists.linux.dev
X-Gm-Message-State: AFq9FYLBHcEFZX/3oXgPZDmLCc5epxQ2evk78/Z4zUNi3NSlPHCYwHSf
	siOB1JwHQccEJfbGY/4RSevvYWqD5rV3sA4knipXkkWp431rVAkcwicTUhgXPDyAncs=
X-Gm-Gg: AYBFou1yQv0nVfH7hPqM1g/WNilbABYUeXo0kMsryoLHxDgIEgh1W531Zv9PnXf98WK
	Ua2d5mHqYASWqGiysFu7XlZbha5L21fcK8uqATdehsFE8/WkA8OsGO+rHV0Hf2klEA5bt6vYgOM
	RhwdCxOxT8WvbYP9GPHiLrL8DAO9C2ztPXjmb9xkg4mqM7VQ13MNArLrkX0y9xCPW2fJdPOmI6a
	ZvcIE/D171oo6rky8Xd6rJpGZhjim961kO/vIvxCEpjy1OmjbcNYCjUmou6g8i8KXRKuZC+P294
	Rfqtq5L+N2dcViQZ1vb/3dTmm/VP6lP3l8bUTAQcDmId+1LidT1nj7YIPEv84m51E2SR7iT8w43
	O2rcuQpT4HdDR26O7P6txeNXsFDeyt7CiE+YAnEc11tym53HW7MvCkJSNTmAZ99RYp3K8Lot7Gq
	uoVEcd/rrx9YuQ5+AX1LPRtfIAOP3UCQJEtYLnfMPEGVeRFFuMZvWq4Jo+VBkBqe9/ZsP1GfORJ
	ot/Bvf7UzGawI9Qh7RR35/y5WhKJVuqi0t8jcHO1YSIM1qGf1/JWq967A96HD5zpBOYG5eN28gg
	4C292iB13X++lu/u
X-Received: by 2002:a05:7022:3b8b:b0:169:9f67:a91b with SMTP id a92af1059eb24-1993505df87mr17730994c88.12.1793123300700;
        Tue, 27 Oct 2026 10:48:20 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm35486813c88.14.2026.10.27.10.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:48:19 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	mmaurer@google.com,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 1/1] rust: soc: avoid dangling attributes when SoC bus is unavailable
Date: Tue, 27 Oct 2026 17:48:10 +0000
Message-Id: <b527648762a76e485b8302835daf3fe26a232e60.1792628232.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792628232.git.pgovind2@uci.edu>
References: <cover.1792628232.git.pgovind2@uci.edu>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`Registration::new()` calls the C function `soc_device_register()` 
to register a SoC device with the SoC core. It passes a pointer to the 
`soc_device_attribute` object of its pinned `BuiltAttributes` object. 
In `soc_device_register()`, if the SoC bus is not registered, this pointer 
argument is saved in a global variable `early_soc_dev_attr` for deferred 
registration and NULL is returned.

If `Registration::new()` receives a NULL pointer, it produces `EINVAL`, 
causing the `BuiltAttributes` object to be dropped. This frees the memory 
containing the attribute data, which is still referenced by 
`early_soc_dev_attr`. A later call to `soc_device_match()` will dereference
this dangling pointer, resulting in a use-after-free bug.

The SoC bus is normally registered by a core initcall before loadable 
modules run, but the condition is reachable if that initcall fails or 
is skipped, as demonstrated using initcall_blacklist=soc_bus_register 
kernel command line argument.

Fix this by adding a new function `soc_device_register_nodefer` which 
never returns NULL. When the SoC bus is not registered,
it returns `ERR_PTR(-EPROBE_DEFER)` and does not retain a pointer 
to the attribute data.
Make the Rust interface in `Registration::new()` call this new function.
The interface remains unchanged for other users of the existing 
`soc_device_register` function.

Fixes: 057d44b05775 ("rust: Add soc_device support")
Reported-by: Dylan Zueck <dzueck@uci.edu>
Assisted-by: LLM
Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>
---
 drivers/base/soc.c      | 19 ++++++++++++++++++-
 include/linux/sys_soc.h | 18 ++++++++++++++++++
 rust/kernel/soc.rs      |  7 ++++---
 3 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index af7d71393774..dc9072281427 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -122,12 +122,17 @@ EXPORT_SYMBOL_GPL(soc_attr_read_machine);
 
 static struct soc_device_attribute *early_soc_dev_attr;
 
-struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr)
+static struct soc_device *
+__soc_device_register(struct soc_device_attribute *soc_dev_attr,
+		      bool allow_defer)
 {
 	struct soc_device *soc_dev;
 	const struct attribute_group **soc_attr_groups;
 	int ret;
 
+	if (!soc_bus_registered && !allow_defer)
+		return ERR_PTR(-EPROBE_DEFER);
+
 	soc_attr_read_machine(soc_dev_attr);
 
 	if (!soc_bus_registered) {
@@ -179,8 +184,20 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
 out1:
 	return ERR_PTR(ret);
 }
+
+struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr)
+{
+	return __soc_device_register(soc_dev_attr, true);
+}
 EXPORT_SYMBOL_GPL(soc_device_register);
 
+struct soc_device *
+soc_device_register_nodefer(struct soc_device_attribute *soc_dev_attr)
+{
+	return __soc_device_register(soc_dev_attr, false);
+}
+EXPORT_SYMBOL_GPL(soc_device_register_nodefer);
+
 /* Ensure soc_dev->attr is freed after calling soc_device_unregister. */
 void soc_device_unregister(struct soc_device *soc_dev)
 {
diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
index cedabf177f47..4bd9ee43be74 100644
--- a/include/linux/sys_soc.h
+++ b/include/linux/sys_soc.h
@@ -26,10 +26,28 @@ struct soc_device_attribute {
  * - %NULL if the SoC bus is not yet registered;
  * - on success, the newly allocated &struct soc_device pointer;
  * - on failure, a negative error code as an ERR_PTR().
+ *
+ * If this function returns %NULL, it retains @soc_plat_dev_attr for deferred
+ * registration. The caller must keep it and all data it points to valid.
  */
 struct soc_device *soc_device_register(
 	struct soc_device_attribute *soc_plat_dev_attr);
 
+/**
+ * soc_device_register_nodefer - register SoC as a device without deferring
+ * @soc_plat_dev_attr: Attributes passed from platform to be attributed to a SoC
+ *
+ * Unlike soc_device_register(), this function never returns %NULL. It retains
+ * @soc_plat_dev_attr only when it returns a valid &struct soc_device pointer.
+ *
+ * Returns:
+ * - on success, the newly allocated &struct soc_device pointer;
+ * - if the SoC bus is unavailable, ERR_PTR(-EPROBE_DEFER);
+ * - on other failures, a negative error code as an ERR_PTR().
+ */
+struct soc_device *soc_device_register_nodefer(
+	struct soc_device_attribute *soc_plat_dev_attr);
+
 /**
  * soc_device_unregister - unregister SoC device
  * @soc_dev: SoC device to be unregistered
diff --git a/rust/kernel/soc.rs b/rust/kernel/soc.rs
index 0d6a36c83cb6..39659dbd31f8 100644
--- a/rust/kernel/soc.rs
+++ b/rust/kernel/soc.rs
@@ -122,10 +122,11 @@ pub fn new(attr: Attributes) -> impl PinInit<Self, Error> {
                 // * The struct provided through attr is backed by pinned data next to it,
                 //   so as long as attr lives, the strings pointed to by the struct will too.
                 // * `attr` is pinned, so the pinned data won't move.
-                // * If it returns a device, and so others may try to read this data, by
-                //   caller invariant, `attr` won't be released until the device is.
+                // * `soc_device_register_nodefer` only retains the attribute pointer when it
+                //   returns a device. By caller invariant, `attr` won't be released until that
+                //   device is unregistered.
                 let raw_soc = error::from_err_ptr(unsafe {
-                    bindings::soc_device_register(attr.as_mut_ptr())
+                    bindings::soc_device_register_nodefer(attr.as_mut_ptr())
                 })?;
 
                 NonNull::new(raw_soc).ok_or(EINVAL)?
-- 
2.34.1

