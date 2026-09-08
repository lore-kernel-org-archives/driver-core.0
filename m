Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ED959B69D
	for <driver-core@lists.linux.dev>; Tue,  8 Sep 2026 17:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889677; cv=none; b=cGteuM3v6B+0Z2UmXu0XDba0tWVnt+nBIjMkE9VzLOsDcc0t6wIxhjYBktBFSh4dsrEIJQXkDfcwBZbR9FBiQ+UwHlqpSts4EqLJ3Lbw5Dmcz9Qu+LdD3w52EyY28Eo3THGt/kJr8N7I322mWo8MNL+Bn1UvHMdzFtaRYeCdhnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889677; c=relaxed/simple;
	bh=a7E1cAnanYVVkRWaKkPGdq4ia4gYC62syLjr8jr85LY=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=pEADgObZgTyz8XO+xPsMXjMGuo4Iaz+fST2QYABt8SZWByCYkZXdJ2z2G92Wi8v2EufZPI2MiU+3NgRu1O7TPM3PU89zJk89ya0CcHZ6DWdA1VBGCTAUxrtjLbNC190AyUVJakctorxIphCyvts8eYsmF9GZJkiuTQX8ahx0BNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fEpD3lv0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fEpD3lv0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788889673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmkVIyJpnqsnRkQ/AN9eH6zCUWkahngJ6micUwzJvZg=;
	b=fEpD3lv02f04aYjZUVDaJ0R9SYa4aDVRsg65vmkOQMPwoEQm3Au4jIomW0c8DcTJOUnZys
	HesPnXLSekdbMKESz+SiThvPnnkaqK+0mKwgLMY4sbExcru+vt+itLhNOJKmsxOUKVp3QV
	y6v9+nMBSpvLFhX2VD32ROOYPBM/Bzw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-jSC11ekmO7S3SUEi859lPg-1; Tue, 08 Sep 2026 13:47:53 -0400
X-MC-Unique: jSC11ekmO7S3SUEi859lPg-1
X-Mimecast-MFC-AGG-ID: jSC11ekmO7S3SUEi859lPg_1788889672
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e820609d9so778000585a.2
        for <driver-core@lists.linux.dev>; Tue, 08 Sep 2026 10:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889672; x=1789494472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmkVIyJpnqsnRkQ/AN9eH6zCUWkahngJ6micUwzJvZg=;
        b=ACSnv4sEWaYiITZhepmrn4zYwK1V6N2SiVtseIhtodGzy+jjuMcvzs95rQv1RJ9BS8
         NaD8Aq9cSx9JiBS7rrsr4TenSkUPEG9zDhdvN+HeFuQPeqnbhTOUhlUXwLwdZn3Utvng
         HbnTONI6e5SHeW7PzO6ACeUILPQPJ3r3+XcI3eBXDMNp0oD33WrDl2VR/as7OxHteOhl
         j64YtgjqOc5oEvgLWlNnprePTv5IboO72JhFEODDkq/TKQinMpsooWazQWvhQCGYYiOQ
         KxeALYgewUkDNK4HUPiHPtm+n5IOq9dkcEWNPg19sJLVo1QXwxiG57q1fwam6mcvJpfp
         BMIg==
X-Gm-Message-State: AFuF++k8qUNqkGRqTIxQIpgE6+lquAJn4yPe7p/1TFgI70VwADDxIYfW
	+8jjY+kZycs4eMbQdyXVYr9+Lf93KRIlUgbwI0OZxdpOcdOqa672Olwn+jFn8byw1HzhhPvLBI7
	b2m9gfqUf2pdJ5Vj98Fj9uyycDVDZCz680wpvVjRhZV5FqAzQ6BFgly/1gN7uJQEf8CHG2Gu12d
	8nJj9oviyd1LVM335MU/kr2VLCSqyaa4SOj8ANVOpkKDuqCms=
X-Gm-Gg: AYBFou38rTvhWfNt/nWQo/bPsS5t16sjZ3NgAS7i3GkZYTX/6rH9icpcNzRXWWcNYj7
	SE0r4l2nhApWelWItlHyC3+y5JCatBoJq/cQZE5rD8Mwi7etE05Ed+r6SyVeE9zroP9QoLXXxKx
	6FRy1cAsd0oKy8TSemoKuKmKMfzXNiV73kA3ID4ZDFM2dWXnrUvvG7fadyAs2qXmTjCcRXH5GcY
	1zCpzJbdW9nelk+1BKdLuaggXdNgSkoDxZ4oGszNO48zqMGTmH5HT5wXOZbzcMvrCYhU86L2Igl
	OPCxLxmmz/Ji0b/jFIkUCwsfOGiR+NqPulYZZsFjczWkLJP4yNqu4K6HzjaLG3yfDqNjKVa6q0B
	uwX4XOmJArevULdcBajvekJqVpKt6B56zPu/4+EM=
X-Received: by 2002:a05:620a:46a2:b0:939:3712:77df with SMTP id af79cd13be357-939803405c3mr3213725185a.21.1788889672242;
        Tue, 08 Sep 2026 10:47:52 -0700 (PDT)
X-Received: by 2002:a05:620a:46a2:b0:939:3712:77df with SMTP id af79cd13be357-939803405c3mr3213671985a.21.1788889666833;
        Tue, 08 Sep 2026 10:47:46 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb9bac1sm1194093685a.35.2026.09.08.10.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:47:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 08 Sep 2026 13:47:18 -0400
Subject: [PATCH 1/4] driver: core: add subsys_driver() macro
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2040; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=a7E1cAnanYVVkRWaKkPGdq4ia4gYC62syLjr8jr85LY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIWeNn2tBU1Ni1/dSggNbqg+dfChvjbuQt/uU6Q59qeu
 buBSUCwo5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIlUcTMynEjas5VdRKHyXNSp
 jwynb6XoznuXmfJN85R/9wbxuKPTTjAyzIwrYIzpUotZnHuvkkEkgW9DRFtASu7/n+a/65dJC07
 nBQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K3-CMufbLDn9hbBKOoJtH3aS_AzihIhHGLC44T2gRcE_1788889672
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add a new macro subsys_driver() to eliminate some boilerplate code in
drivers that need to register earlier in the boot at the subsys_initcall
level.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-8
---
 include/linux/device/driver.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index 768a1334c0a1..29fbc01ef06f 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -297,4 +297,35 @@ static int __init __driver##_init(void) \
 } \
 device_initcall(__driver##_init);
 
+/**
+ * subsys_driver() - Helper macro for drivers that don't do anything special
+ * in init/exit but have to register earlier, at subsys_initcall level, when
+ * built in. This eliminates a lot of boilerplate. Each driver may only use
+ * this macro once, and calling it replaces the init/exit boilerplate.
+ *
+ * @__driver: driver name
+ * @__register: register function for this driver type
+ * @__unregister: unregister function for this driver type
+ * @...: Additional arguments to be passed to __register and __unregister.
+ *
+ * This is meant to be a direct parallel of module_driver() above, but with
+ * the init call promoted to subsys_initcall() for built-in drivers so they
+ * are available earlier during boot. When built as a module subsys_initcall()
+ * collapses to module_init() and the normal module init/exit paths are used.
+ *
+ * Use this macro to construct bus specific macros for registering drivers,
+ * and do not use it on its own.
+ */
+#define subsys_driver(__driver, __register, __unregister, ...) \
+static int __init __driver##_init(void) \
+{ \
+	return __register(&(__driver), ##__VA_ARGS__); \
+} \
+subsys_initcall(__driver##_init) \
+static void __exit __driver##_exit(void) \
+{ \
+	__unregister(&(__driver), ##__VA_ARGS__); \
+} \
+module_exit(__driver##_exit)
+
 #endif	/* _DEVICE_DRIVER_H_ */

-- 
2.55.0

