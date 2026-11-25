Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795636789;
	b=1psIDFCFenUTytR4c5rEVnP7mACbsBNNz2E2Rg9bAuw9b4EfLSLdcXW5met8wpc9eso8
	 7l2TFTcBNkiSHQaxQ4HjDIRBOySq/D96uWV5AeWJtixDBvmEjZsDhsNh/0NWi/1WSYdXR
	 82xFqPylQAxC/Joim8XALngIJF8h4aUsnxKJnNQh4iWybPYTsdAwNV21DixhX6v6cihdb
	 8OuH4HUDfA63wt1y6DWuGmTl4SmLC1ATqcoLG3nt7IJxAGij6faG2fsy+4it294IhjT1T
	 2snxQwYOCa+5yxsT52jCAwl/S5ECjZYjVYyQEUEJ85baaaox4kt37tQilq2AYDtChEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636789;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=XFGeHnO41wQThwSaa5KXLEiWWiuY84ny09QOskOc0hQ=;
	b=Ms4rPk440iGNFrTSgfQmYgkr8/wilWlnkYSSzwgLnIq8BHq/NSqC9qPI7mWtqlF9qsoG
	 IdSwb5XD2rWMa7NMy86Bgenl+WPB0E8LBwHycSLMIrjM40BkE/owYce7KDPzI6nZ+A7rn
	 b9rDa6pplliIK/zApgJuY16+arF3FnvbxMnORH7RAP+zTfuhDBWYFBxgMutRuYyBFL634
	 ZNyZp++BLkc3GOTrCBjKUMpZ6xSlmQ9HLGboG1cfc6xPAcvmJ8RKou9Xy13yLpbrbkU1H
	 LbtB3bRo6BYv2oB/OQJ1fyptK42mfrWn6VGmPZPs6Xt4MUE+iRftVAKNmflO+gdS5+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=d6mAjL4w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEB7606A31E
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 19:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BEB7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=d6mAjL4w
ARC-Seal: i=1; a=rsa-sha256; t=1795636770; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TfChQJlevYzacqlUs5E50T2a4Ex8FOkFSrYn/uNaxZnlNmkfxt+LKyGS0aWJrt7nAf+WeXyezi2Dv15ISzqAqkJZqEfysX2pNxm+AdwRQAEviVZ68t8l/3iGfu/DwQi5r6YYgb97zvP0VtyY/yKX1o1v9VKq8iIuWXKEyqzUkXM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795636770; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XFGeHnO41wQThwSaa5KXLEiWWiuY84ny09QOskOc0hQ=; 
	b=WwpfBSSagcpQAIirt+1FNN4fOeSTu/B8l5ovgqHJ+K8aEm/2AstsbVQc2t3qHst0TP4dUi26TPbLxX7JP8PeC8s7cXFyCKrEv4TqU2S3n3F4R2pxGeveR4Q/FIrROcVLf83obJiYgUJeW19ZmhJEGXY3Hf8dO9SYBzOsOjRuh5I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=d6mAjL4wHpUEOODbjZ7UfyaaVnxoW2SPYt3uZYQ+vg3HvaBNwI/1z/YAp0TG0Wzz1VYWhz+ETlGpdx2wqt5DZmubBE1PVCjcgYPrUPHfmhlbxMFUG4Y4qGRnFH9OIiUZkZ2qfQaZrH2Ira+CU69KDw+aBHk4GQ3LZY3RKCmK5Ck=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=XFGeHnO41wQThwSaa5KXLEiWWiuY84ny09QOskOc0hQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795636767086600.8023695989365;
	Wed, 25 Nov 2026 11:59:27 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v7 09/10] drm/tyr: support write-combine BO mappings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20261122-tyr-ioctls-v7-9-3a2af624b992@linux.dev>
Date: Wed, 25 Nov 2026 16:59:08 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Johan Hovold <johan@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 driver-core@lists.linux.dev,
 Ke Sun <sunke@kylinos.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <992B7455-18DB-46A3-8C94-EE5EE937EFC4@collabora.com>
References: <20261122-tyr-ioctls-v7-0-3a2af624b992@linux.dev>
 <20261122-tyr-ioctls-v7-9-3a2af624b992@linux.dev>
To: Alvin Sun <alvin.sun@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External

Hi Alvin,

This patch does quite a few things at once and I'd rather split this.

The change we _really_ need in your series is the stale cache eviction
problem. It is unfortunate that this is a problem in general, and not
only in Tyr. For that, using the DMA API as soon as the BO is created is
enough. You can do that in patch 6 by calling sg_table() before the CPU
is allowed to touch the buffer, like you already do in this one.

Two other things are done by this patch:

- Honor writeback mappings -> this should be its own patch.
- Add a "coherent" flag, and thread it through the driver.

What it does not do is "support write combine mappings". In fact, write
combine mappings is the only thing properly supported and tested so far
:)

The problem with the second bullet point is that a) everything else
needed to support coherent=3D=3Dtrue is missing and b) I don't have a =
system
where coherent=3D=3Dtrue to test this. If others do, great, but even =
still,
lets do this as a separate series. So I'd prefer if the coherent flag
was dropped, along with patch 8.

=E2=80=94 Daniel=
