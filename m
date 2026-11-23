Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475188;
	b=ExCqWscq6J67aPJEnXITRSwDaSntZRaQMxliJiKJuoFQOvHXRd540UyODwMrkB60Pwmw
	 /O8xZAdzpEURrOk2eFIK2eAPfI5LJWWzYi51IF9EwhDomQmzHzSbwv5MxD2vPdOkOc7im
	 9EiTdXqET9gYTD55qlHEyqxLy052UjoB1AoHwZZpkuKVYCpATayghr35rzZV78E3q+lDV
	 VGTPE8NzyqRGa3DCDXKEySUXsgpAuIIoLB4MiUm+tQpOc0OBfrXXWJXFbQ+/sFNICUi5Y
	 BN0DI5urpoVrlG6grPl19fNEalkqFUaU0cJOVG/d8yha0oNe2YOXMJ9FH6qlKmnRPcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=umX51t+2vvQvnn/vRHnudssMt2lYCcNqFYn0hYVrUj4=;
	b=U5oqr/QNt2jsB2wuwpyzS1cSqTTQAQJH0CweRX1cRfCrYmp1u5GxpdTUED+8S3hvdRHf
	 ILw62Jyw+Q+2f9LfcFgRYZ2WlSaSQK15ECNAwp87E5QasCOKkb8rh1nPqGRSuKcm9yiyj
	 V60yDUQf6JxpJRmbTA6BFItC3Nr7nB66i9eHSSoGpzwq2Rba22kahDYZiVeMX5rA/ft9G
	 5S35k97gwxAYr8W65mPcMQYlZuhqeo5NSkyoK8lgj4eVdfpYl0t8IBLxMML+cTBJ3knx4
	 iIzgLVveqGug3agbgWCeShpOim1yysvKFmVpeaVpVti35Vg5TfPOd68snYEgwV5p+uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pPBy2urt;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577C2606A321
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 23:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 577C2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pPBy2urt
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be4fea434bso4534636e87.1
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 15:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795475186; x=1796079986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umX51t+2vvQvnn/vRHnudssMt2lYCcNqFYn0hYVrUj4=;
        b=pPBy2urtE+Cri2+wpoB3h20UCaobhwj6xZPaB6prxljkFGfnJHlOCJkr1zXaFZ47j3
         2tLtipgSLhu7R/5m/IFEu5Ttc/wP6z+uH3dUb95WPzm7Pmk63VneONOUaEHc9Bwfm3bR
         vU+wVHyF8S6CGWFVQN9sL2zT2A+JqWcmj8CKaVbCmDeok/0/2jqB/CmhdVMRWw7uNdNs
         wsLJD8VNprogMRTimh1+WhGFHpebJk75zhyT3dXZtrrvUyobsKzAGQLQMwH+0dXbwZM9
         U7heMUqzu6OZoHQ+uuLlYx1r9AVQPJFh6kexQTxFaDpNKDL4AjDbMSdKY4e4ClwQHK6M
         /gaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475186; x=1796079986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=umX51t+2vvQvnn/vRHnudssMt2lYCcNqFYn0hYVrUj4=;
        b=KJLrjaK3kGgpoIlrZBDw0PWWgxTkpFa+1sW7RDRmu0l1eBeGbSnNDbSQ3/DYv0THbN
         mvdAPCynSwa3TmhJfiwGX7CMJwg2TYxFpvSZs+dKcENl6sQ6tO23DMoy0iW/QWDYn3xK
         2INFJZY5v0RlsPuCGfDq1CFdm/v4O/PX+UFFuow/FMdv4ot8O+zOKeK7pUcENsJEaGl+
         LgHZnCme62uK6c15YTvy/lmiO3+1LFT/+ko1yRlHMPyevPmPo1E0rCY3rNreqh6mKPO2
         GNzmSN8zIfFs4Lspk3v1ob2wyVbzCL35/bhWB+tBE+lyqnmvjCS9Qro6fyrRdLbUHmdR
         fXuA==
X-Forwarded-Encrypted: i=1; AL+hErGctPmwLZBU6dnMav0Hcw8jw3EXEzGIxRq2pn6Et0nyciZGA2sHVMXQNCTivjgcT02tVSkyIMyDyX7v3w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/KGMkS1agsEshuXOsbW4jp3/WVNKr8XvoXyQA5gNhX7iK9q7cX
	W4YRcAZtN7kkCSAr8AxldqjSF3uZQuwKrkK+nsnmQzSbtIePNFJRm9qJ
X-Gm-Gg: AZFdTZeaGA9l5P053I2IUUPCGcaFmu50fj7zsuaQ+4CeRg0GN3/MkzRG734eKSXvUYF
	bkh6UMb4Hk1U3YJDEt5vEj06ijFMsLIWTXS2fD97xAgGtDcWf1TpkdOL+H2s18WYhCymFlHCgut
	yMKx3FecA2XYQ3MNxD6RwCxdiSCNJYSsH8s5G0BUyTAGCZEpZKFUSaJuqlDJVvdFjDRVQWW4poN
	dL0zk93oL52dv8o1jywmuqCNHGVF9ncB7qKPGPxY6Rrfq2YYGWSrYOilckJmn9n8lNoXAXcnGIx
	i1Glxx4N515/rCtkasEnVaUSanUBsJ5PnDjlwfGUYZd0W7tp9nal831BlDVvVDdmeDYhIJ3L7wT
	8Wg9+R2D4CzL7gm4YWJ09lZUTyc4aqYvfeZuGZjVToqFb7L7PiER3UYrG/49UZsKEiLaHBv3RSp
	6Z5GyeWWlFA7BPbGyFWq7F0wiGzFIXdURzluoPtACpAnvbH+S0VXP/Uih+JFZcrc7ZeQvirRObF
	uKpEng5hgWwaMDIXlOqv0xytS3Rd+/erOGSk46IwpwfLERM7MDt1pxIHH3FRPG4feY4bpEhJPLn
	YDSB55V6CGS1xfjwx+j7BSQ1MoS27VWMOQ==
X-Received: by 2002:a05:6512:a96:b0:5bf:fc1b:561 with SMTP id 2adb3069b0e04-5c1b74acaf4mr3644137e87.0.1795475186305;
        Mon, 23 Nov 2026 15:06:26 -0800 (PST)
Received: from Swift-SFG16-72 ([141.105.129.181])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8055106asm36984711fa.32.2026.11.23.15.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:06:24 -0800 (PST)
From: Ivan Borovyk <saref012@gmail.com>
To: dakr@kernel.org,
	ojeda@kernel.org
Cc: abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivan Borovyk <saref012@gmail.com>
Subject: [PATCH v2] samples: rust_dma: add missing newline in dev_info! call
Date: Tue, 24 Nov 2026 01:06:17 +0200
Message-ID: <20261123230618.375172-1-saref012@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123010430.365536-1-saref012@gmail.com>
References: <20261123010430.365536-1-saref012@gmail.com>
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

The dev_info! call in PinnedDrop::drop() lacks a trailing newline in its
format string, unlike the other dev_info!() calls in the file. End the
format string with '\n' for consistency with the dev_*!() and pr_*!()
macro conventions.

Fixes: 5444799d701c ("samples: rust: dma: add sample code for SGTable")
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Ivan Borovyk <saref012@gmail.com>
---
 Changes in v2:
- Correct the commit message: the modified call is in PinnedDrop::drop(),
  not in probe()
- Reword the rationale: consistency with the pr_*!()/dev_*!() macro
  conventions rather than log concatenation
- Add Fixes: tag

 samples/rust/rust_dma.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index ffb693544673..b4b161896517 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -129,7 +129,7 @@ fn drop(self: Pin<&mut Self>) {
         for (i, entry) in self.sgt.iter().enumerate() {
             dev_info!(
                 self.pdev,
-                "Entry[{}]: DMA address: {:#x}",
+                "Entry[{}]: DMA address: {:#x}\n",
                 i,
                 entry.dma_address(),
             );
-- 
2.53.0

