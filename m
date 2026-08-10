Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56A1429827
	for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 16:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379697; cv=none; b=jqTSemA4p0RZyfZkHjLdc+V4t+3lSUEkNtZgoxaU/puKbsx/yu9sKlToDn8F9tt9SgDnqrgBFSWJPDi0gW3tV4UiN2PbP2b4lijuO5KW3P/3c1m/TLGipxC9NbJa4BiKWsMTKSLDdXSQlI+hG8vn1oEpxG7SxXe8i4rQEvmDAO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379697; c=relaxed/simple;
	bh=AZylGUQN3FOyOExthuRk7+ALVyRlRDv5nRJSPRc+2G8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EthkRnqJbnJiKMLdx8wqWjzDRgCYcMMDEkta1jsN5zTycc7XJOLnaaoRWc8CtBemv1Og+slORJWR4Lhw2UQvr/aQHhOxgf1Iv+k8/cGasMWHRPvQOG1o/qW23Dwb9WXMFe2LQGV11MeBQ+m+jhwVCGHfqbYJuJux6AUOdZH7CSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kHoSEaNm; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kHoSEaNm"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6983e9c028dso1568303a12.3
        for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 09:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786379694; x=1786984494; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L84OjIpSeCWFBArdFIo9a7688YTN2+iL7sp2DP0ZJfM=;
        b=kHoSEaNmSlq4ZAx9dzwt6k00c6Kr3YE5SUqC58MOfWOeeezdDQJobu8s80aDSzoSCS
         5sahF68H0GjRL9XtoDzHfA7PqIW6CHw/20uY189ijVJ3I7d8KFayQhnCh5IIEUVxHFkx
         Y90Ivn5cSOVm7k2IVQCmpTDLJUjqz2fh6Orsu1npIxHWgB+7OJeGu9G98FJJXtQibbqQ
         lWTQrQLPd89ZmrFRpGUZ5WPyG5esBmY5P18ev+fCDqzkL91deBPoyltCUrEEnEw8cGqJ
         9kL4QQdhllCsgbKA2S/+04JugG+XGo/x/8ph+NE/is9y6Pj5EmyStYeYaGFu4QIJcxYv
         uDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786379694; x=1786984494;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L84OjIpSeCWFBArdFIo9a7688YTN2+iL7sp2DP0ZJfM=;
        b=V89s+Ky/UniRWAkVGCitTohtBWD2qTpZMRRKPX3gNRck3XimWUoyEi7fQ85JA0gqTX
         ZQILo9UUIsDo/VjYBIHhDIFEgmgnXa740kVbi47sw2m18UsLGEx4evn5bmna86i2mE5+
         ELaRLslAoe26bNDRzqZQ5PmZrCKsfNsTsz7D4IOlhKgysLLAsVt3IN8NBod5WQV8pSJ5
         2XYLd33O3LOQyJX1OMwXt/6l2H9EPKfAX/1+3UaZ3O6B+zaN+X87VL4QFa/wQqiSz1lH
         49JuPF/0fnWaKofnYCp9561wbk8GNlvZqlANxAo9qdfD5DR7/yy1SWGhap7cC1JFxuMZ
         jzbw==
X-Forwarded-Encrypted: i=1; AHgh+RpZ4QkrlkC+3cHcipkjlXilGwX1G7TxdGDHN69bvVhCZeBPSpUa+JYZWsM62dSSoZzoyxvsl9F9RWkdMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIPHj/iIMf6NwFVfeUwBxwQ3B6CDPjAC2xqoT1aAhHqM+KnbIh
	Gj/XeyLrqXHGjaSUbx5b1W/tA0bvoAw11W57N2SRSiLKmb0pJMAgEj6KlYDdYT9VfeFqk7t4TIK
	9OGnq2XA0zclde0zkGg==
X-Received: from edgj25-n1.prod.google.com ([2002:a05:6402:a5d9:10b0:6a1:fe68:3f56])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:278f:b0:698:af31:5a9b with SMTP id 4fb4d7f45d1cf-6a14f0b8fa8mr21454308a12.9.1786379693823;
 Mon, 10 Aug 2026 09:34:53 -0700 (PDT)
Date: Mon, 10 Aug 2026 16:28:13 +0000
In-Reply-To: <20260810162814.1398016-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260810162814.1398016-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260810162814.1398016-4-tarunsahu@google.com>
Subject: [PATCH 3/4] EDAC/versalnet: use put_device() on device_register() failure
From: Tarun Sahu <tarunsahu@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geoff Levand <geoff@infradead.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, dmatlack@google.com, Borislav Petkov <bp@alien8.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, djeffery@redhat.com, 
	Tony Luck <tony.luck@intel.com>, skhawaja@google.com, 
	Russell King <linux@armlinux.org.uk>, stuart.w.hayes@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-edac@vger.kernel.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

When device_register() fails, calling kfree(dev) directly bypasses the
device_release() callback (versal_edac_release) and leaks the allocated
driver core structures.

Fix this by calling put_device(dev) when device_register() returns an
error, ensuring proper refcount decrement and release cleanup.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 drivers/edac/versalnet_edac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 97ec05d68bbb..2912b3658915 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -829,8 +829,10 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	dev->release = versal_edac_release;
 
 	rc = device_register(dev);
-	if (rc)
+	if (rc) {
+		put_device(dev);
 		goto err_mc_free;
+	}
 
 	mci->pdev = dev;
 	mc_init(mci, dev);
@@ -852,9 +854,9 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	device_unregister(mci->pdev);
 err_mc_free:
 	edac_mc_free(mci);
+	return rc;
 err_dev_free:
 	kfree(dev);
-
 	return rc;
 }
 
-- 
2.55.0.679.g6767b8d81c-goog

