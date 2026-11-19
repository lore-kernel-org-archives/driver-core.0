Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097582;
	b=18OBvHWNwbMeOy6iT+M7JP3iMGo3ddOviJC20cptI44py10ZZoAnjpp2HtgKVcnd2oQG
	 KwHdAu8a6jt8dHZ5GRMp9gd3TKCv8SdwZSUbU8aUhm2hbzopaiPIFktDnzye+2K4EdjaB
	 OBOx3OcMmPGRaefrM07iWuw4tA9x+CNGfb7NDjP+Lrpobx516RU0ZzkndMOJxevEJUZ4o
	 RU/9oRxstZKRKjx/Ls3QDaAPBTA4vDf9Kfw5OrO7z+Op8e8sXVfYgDHYuZSMTJJPmf7/U
	 eIp6qLN0E+jN9Wgl4kLj4OBfTWWoWEyxswLfJiWdZ2V/3E++YDcfOZUevHD1YTVaH8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=iPOg98WErXU6k7QxTjI8OWeHV+3pxtJAY0SLKw9CUN8=;
	b=oNyfJRYE8w9fDeQhYI814Ur5mDJdGiVVzOCIsYhpBxBIemT7Jye15ARYXRF8itgkSGxC
	 Kd4hKNXni1XO2DJKlWl24mg2VvIzPbIZLOHq7xG9rsmOP70c/xC9dO9uXntqNEfxdzm49
	 lJjxyQ8oZyx2st6r7qDqhrPHaq+1cy6fSpt58e5N6BS4f/gP3o9lyTuUw0Dp34/QT52Pv
	 sohB/wEoy6G2zyUK7OrHsLzW6/eXPjUWfXEKfUf51cY//V28UuB7lDp3VboWJm7wH0HBP
	 fbtMt4fyVvMykSYH6uGGcxqK9nXehyKnyoh7VPSIyz9kHqmFs2iN2GkMSVl9EpRpLMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EiHHmXMF;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF7E60A261B
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 14:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF7E60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EiHHmXMF
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49d70f45b22so1426369f8f.2
        for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 06:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795097580; x=1795702380; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPOg98WErXU6k7QxTjI8OWeHV+3pxtJAY0SLKw9CUN8=;
        b=EiHHmXMFDfealVz92QrGZiB1DCtKkFZt7q94c95AV6ChKH68bNG2pbiP8XOr/3Gx0E
         2N59FsnoFsRA+OD/JfSa0Y07Na/EzsPliQY+II3pDwyzUMOICy2X02kGR3Wmm6E+s/77
         BNEMcnUlUMAJdEYgUJ9q/5rynTf0lvO+sD0xj2hZK5n+oyPjujnfN8pX6e0x7PCXkCh2
         YLfjBm1kdp3i/o4CJKfBjqLdsqtKaxIoI6Vnnq604i766B0rls5CRcIfsOdfmVGmILN/
         nX7llfx7hSPjl7cwyIYEqlxI9ff49Nzqoedjs42FxXrInFv590Fcxe3YXKRuBHBvZ/2C
         jDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097580; x=1795702380;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPOg98WErXU6k7QxTjI8OWeHV+3pxtJAY0SLKw9CUN8=;
        b=2tr5cKYnqLLsbK/5bz5ZZPdjp/7bRb8Plspv5YexH5j263bxnyq79v+23wXCra5ht+
         UCiX+vM0dEm2LU+9w1Oxze4FAcLkhEk3m0OJIQx9KdPq3xojTaK+zEX394fQs9uMQDP9
         GejZwCi/0ujNxUUnqMvOLWFx/rAvn5mu3vsjehifRvGIMRq9RUk8IgPth3/4bKvrzz5B
         stP6d+eNN4zJMW6M1Gsjp9uNBRuovb84Isp/73FWtTahE2BPn1cEIh/D1smljD9EW341
         BwdKtAj5VH+sOT8mjhGgw6riWtoDAaKg3vtbTF4cfdL9w0ZS30euUbBvLBCzxXY2xRQp
         UbqQ==
X-Forwarded-Encrypted: i=1; AL+hErE7pQyUBN5BflymwMsHkW3M/Q69FxOUXhep0F6m5o3u8HxQ4pByaCJdJVa/l7eoWnRFZd1vcfAHZCCsgQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z96LA8Gb4mTjqjTWswV6RQozkd3sIrO/9EH4j+q6oPtLs/OWvo+
	jTfOObE42tpvzDDh87MVyajQnW11PFM0Ss13xx6Z0FBopZr/zTDKmSwQ9WAvb7GtxDP2wOSDstI
	jFM4a0f2kPo2bEYfdLA==
X-Received: from wrob15.prod.google.com ([2002:adf:ee8f:0:b0:48e:d59:85ff])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2312:b0:485:8cc8:1f5f with SMTP id ffacd0b85a97d-4a63c6590f3mr13110796f8f.42.1795097580124;
 Thu, 19 Nov 2026 06:13:00 -0800 (PST)
Date: Thu, 19 Nov 2026 14:12:44 +0000
In-Reply-To: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=8dTFAUonXyEkYL/wNlIdqEDt0bd9IpV31R8kzKFHvmk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/wPjARfxvVTAMK4l8BhuFbpAzEG8l6+qpcHqZ
 cfRD3c7ALCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCav8D4wAKCRAEWL7uWMY5
 RpnED/91VIGr3SMg9ThB0WCISSggasOnHr8OML7VCrcXnwq0UKb2vwaI0zt4AGoHrZRhI3qjJo+
 MYEKV3UyEeQopABjBbi7R/Bmx6tFec4YIIJepzh/VCWTR7zvWdUHh/ec0pbgExBrNj+6fgPW0TR
 0qM6K0+w7C5/9qKjWWh5zSnoVf/yUxV6Nbq/NEKKjxivJ+pDLGr953TIzBZkeF41mEyshYXZmBb
 rYwGC03xarVxkBoTIPBplpqFZDrl22+9Y4FIgpzKeIARQNmjshJCfqqVYiiM7xdQ1HgFo27kj7u
 mOnvEUSL3X6oDGlHqEG6l6LWxygpDTXV84dDT3fY7UD1juMCpE2q1qGR+r0YuEWk3bvMkc7rA4i
 hG//99d6NFQBlKDU7y3KDYN+TUJhyeZNBSNWWZ3y2Y9l3wZam9BCpa+pcACbfcJpD0H405EJVpt
 Gf0n+mMcQJ1h5ILlyeblNqwbxq0KONGHVYSNmpiTzbwPmEHItO44DsZSrM7usHt3P7T0BnQsV9H
 4HXVZSPtbslryRbc3eVng3aYXjlE4PBXvVIZgPLODN6bLk/4CB1o26D2cObOLHW1wRS1LUxgc4s
 NJRST19b+9LQbztdmFaWMTIcQPSKufNVip+j1Ye9ykscRymsX/CUGmRsoxYySpBuftIuesTfMpg A3P8zazraOC+gXQ==
X-Mailer: b4 0.14.3
Message-ID: <20261119-rust-workqueue-v4-3-707c68994940@google.com>
Subject: [PATCH v4 3/5] rust: workqueue: create workqueue subdirectory
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The following patch will implement a workqueue builder in a separate
file. To prepare for that, create a rust/kernel/workqueue subdirectory
and move the existing file.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Philipp Stanner <phasta@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 MAINTAINERS                                    | 1 +
 rust/kernel/{workqueue.rs => workqueue/mod.rs} | 0
 2 files changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccbcdc0799b9..9d5e2278f1f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30299,6 +30299,7 @@ F:	Documentation/core-api/workqueue.rst
 F:	include/linux/workqueue.h
 F:	kernel/workqueue.c
 F:	kernel/workqueue_internal.h
+F:	rust/kernel/workqueue/
 
 WWAN DRIVERS
 M:	Loic Poulain <loic.poulain@oss.qualcomm.com>
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue/mod.rs
similarity index 100%
rename from rust/kernel/workqueue.rs
rename to rust/kernel/workqueue/mod.rs

-- 
2.56.1.708.g77570a6a1d-goog

