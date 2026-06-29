Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E76A39F190
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 21:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782768756; cv=none; b=jwV8sir1bfqGePwcvZtCKMhaA8eaW03Tp8K3PMhrKkUBkdgi4IqUquBJV0cqTn/D1antkyeBG96ImxJYAZMnz+lAS/JmokiNHXYc4bk+sd1e7ODSww2SSdD9AuiR+MTjILN5bIQ2+gNB9VjmGgl1gPGdDdVJB2y6/6F9jciMxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782768756; c=relaxed/simple;
	bh=6XB7pqHpgq/nQnB1tGmENNG6g651KvMQ7dydjVpfr+Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CGZw2TN9kpJny1Ns2/k/RvHDPSnHVEOuDw8Z12vGpWd2Zr49mWdxE1eUDbYCzu0LrfnZAOfyJ45i2G14j6aWb1WURudLj9dDyhC18M6xjjgVhnZwhmQwdjYn2WMbAF7MQ5E9dndjeZ4i0fCJs3puGeEqGKyJUdF2YF95YmrwmIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=blLZGisB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="blLZGisB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782768754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6XB7pqHpgq/nQnB1tGmENNG6g651KvMQ7dydjVpfr+Y=;
	b=blLZGisB/IxYi+yCROb5D7vd5+fHkTLNOwO7XTf1tCup8p0nNvuiVqQ5LE+2gK93t4/M8f
	P7hH8cLFiRcY5NDK54P+TiBHDF5fwUiPaOemp2uL0NARg48l9zBLJgd4UzMmqaBuYElm4+
	dS3MSz7PU9cBXK+shwnwCOXUl7K3zP8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-rNdTwus9PrSjqHaizIFCcQ-1; Mon, 29 Jun 2026 17:32:33 -0400
X-MC-Unique: rNdTwus9PrSjqHaizIFCcQ-1
X-Mimecast-MFC-AGG-ID: rNdTwus9PrSjqHaizIFCcQ_1782768753
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e86066fc53so76351526d6.0
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 14:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782768753; x=1783373553;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CSRk1nqmk8ToNWejBPUj18Gym2Ng80mr6qO9hwj2XTo=;
        b=YY1awGMaFBML8u14lXjk/Au7qYpHkilEyclRSrby/XgxP5y0MMu6sCbH9MOGrYZuO1
         mW7HZJrDXzWtwf1d8976eY87jtXFsxdmoCDVn5PrNuxoiBf1/IefTxX93KR8PmlpZe9d
         Jk0/5A8EtTkW9IcOLA1UwmvMIwP3oWWMirG8Lk98hbV+sdWXMO7MVEoZG/sZy1NjOoWy
         9vEN6JIJFyMcF8cSZZAPiFT47b8QbnRtDxZDPBmzKac2Bq+lPmBBv5jEWBnrzZ0R2n1/
         6rubXTsH1VLchPlFx+kUDi2RXJzrytzK1pIfEg8dXli4ulLDXh+aRdZT0LDB+GFUQrVn
         CL8w==
X-Gm-Message-State: AOJu0YzKwxjiGbrdVI0bF7s5xac29i2X9QgtESEA2H/WnLmH2wuZEHmf
	+5+lkRQiGG6umoctKg6M93ztsYXoK/ejDBJtvVT3G+W7BPmuA2G4JAd5/8fUvYYZGv/IxqOp87E
	9MY/JpfeNrClRwkhL2YfZqLxoNVx3lmf5jTL3by+jgcjdvSiG1mmZ2YU/Xzj3qkIE
X-Gm-Gg: AfdE7cmlVnVJBjK82ANxghLqdGZ3c7paZsUCl3XWuVNylFehYb8gR5zWI26rhs2xzu0
	KRcKqYNLB1k9vPdmE70BvINqIq2A2hlFUzJCxtC7Udhf7NfMYOQVHsW+wepr9ltK02u58U39hEr
	TVrUdAUyinDq/VOskAfcZ5RRMMyHNYCg2j2P3iD+gHuy/NsSOcy6VO+pDx6OLHbG7R0w7l4fvOO
	9gxi5qUNJvPjlguvdbsCYxlBhvqTufqKd3Ca0x4eVeA5DSq+PocZdUw+OI6RMTKgf+dTToONj74
	r9Keus95iEf+4Y6AQyFuaVbDu/CC5oXz8Or/+lBRTdrDJxNJ3AQ+oQ17X7Amqn/hjBjoSSG9Ro9
	+KUYtK08=
X-Received: by 2002:ad4:4eab:0:b0:8ee:d9b8:8538 with SMTP id 6a1803df08f44-8f1bc95fc6emr16242476d6.9.1782768753040;
        Mon, 29 Jun 2026 14:32:33 -0700 (PDT)
X-Received: by 2002:ad4:4eab:0:b0:8ee:d9b8:8538 with SMTP id 6a1803df08f44-8f1bc95fc6emr16241016d6.9.1782768751191;
        Mon, 29 Jun 2026 14:32:31 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a7b2699dsm7151196d6.46.2026.06.29.14.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 14:32:30 -0700 (PDT)
Message-ID: <24195bd1807ba2b47b80a30050d12ec010ba4f1f.camel@redhat.com>
Subject: Re: [PATCH v5 01/19] rust: drm: ioctl: fix unbounded lifetimes in
 ioctl handler arguments
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, ecourtney@nvidia.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, 	lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, 	deborah.brouwer@collabora.com,
 boris.brezillon@collabora.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org,
 sashiko-bot@kernel.org
Date: Mon, 29 Jun 2026 17:32:29 -0400
In-Reply-To: <20260628145406.2107056-2-dakr@kernel.org>
References: <20260628145406.2107056-1-dakr@kernel.org>
	 <20260628145406.2107056-2-dakr@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PRVVURP35PeRRC8Z0C7GK8zFWiOrMMnc9P9t3uV3X-o_1782768753
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

dGhpcyBtYWNybyBpcyB3aWxkLgoKUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhh
dC5jb20+CgpPbiBTdW4sIDIwMjYtMDYtMjggYXQgMTY6NTMgKzAyMDAsIERhbmlsbyBLcnVtbXJp
Y2ggd3JvdGU6Cj4gUmVmZXJlbmNlcyB0byBkZXYsIGRhdGEsIGFuZCBmaWxlIGluIHRoZSBkZWNs
YXJlX2RybV9pb2N0bHMhIG1hY3JvCj4gYXJlCj4gY3JlYXRlZCB2aWEgdW5zYWZlIHBvaW50ZXIg
ZGVyZWZlcmVuY2VzLCBwcm9kdWNpbmcgdW5ib3VuZGVkCj4gbGlmZXRpbWVzLgo+IElmIGFuIGlv
Y3RsIGhhbmRsZXIgZXhwbGljaXRseSBhbm5vdGF0ZXMgaXRzIHBhcmFtZXRlcnMgd2l0aCAnc3Rh
dGljLAo+IHRoZSBjb21waWxlciBhY2NlcHRzIHRoaXMsIGFsbG93aW5nIHRoZSBoYW5kbGVyIHRv
IHN0YXNoIHJlZmVyZW5jZXMKPiB0aGF0Cj4gb3V0bGl2ZSB0aGUgaW9jdGwgY2FsbC4KPiAKPiBG
aXggdGhpcyBieSBhZGRpbmcgYSBoaWdoZXItcmFua2VkIGZ1bmN0aW9uIHBvaW50ZXIgY29lcmNp
b24gdGhhdAo+IGVuZm9yY2VzIHRoZSBoYW5kbGVyIGFjY2VwdHMgdW5pdmVyc2FsbHkgcXVhbnRp
ZmllZCBsaWZldGltZXM6Cj4gCj4gwqAgbGV0IF86IGZvcjwnYT4gZm4oJidhIF8sICYnYSBtdXQg
XywgJidhIF8pIC0+IF8gPSAkZnVuYzsKPiAKPiBTaW5jZSB0aGUgaGFuZGxlciBtdXN0IGJlIGNv
ZXJjaWJsZSB0byBhIGZ1bmN0aW9uIHBvaW50ZXIgYWNjZXB0aW5nCj4gYW55Cj4gbGlmZXRpbWUg
J2EsIGl0IGNhbiBubyBsb25nZXIgZGVtYW5kICdzdGF0aWMgb24gYW55IHBhcmFtZXRlci4KPiAK
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IEZpeGVzOiA5YTY5NTcwNjgyYjEgKCJydXN0
OiBkcm06IGlvY3RsOiBBZGQgRFJNIGlvY3RsIGFic3RyYWN0aW9uIikKPiBSZXBvcnRlZC1ieTog
c2FzaGlrby1ib3RAa2VybmVsLm9yZwo+IENsb3NlczoKPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyNjA2MjAwMTEzNDYuQTQ3RDAxRjAwMEU5QHNtdHAua2VybmVsLm9yZy8KPiBTdWdn
ZXN0ZWQtYnk6IEdhcnkgR3VvIDxnYXJ5QGdhcnlndW8ubmV0Pgo+IFNpZ25lZC1vZmYtYnk6IERh
bmlsbyBLcnVtbXJpY2ggPGRha3JAa2VybmVsLm9yZz4KPiAtLS0KPiDCoHJ1c3Qva2VybmVsL2Ry
bS9pb2N0bC5ycyB8IDYgKysrKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL3J1c3Qva2VybmVsL2RybS9pb2N0bC5ycyBiL3J1c3Qva2VybmVs
L2RybS9pb2N0bC5ycwo+IGluZGV4IGNmMzI4MTAxZGRlNC4uY2NmNDE1MGQ4M2I2IDEwMDY0NAo+
IC0tLSBhL3J1c3Qva2VybmVsL2RybS9pb2N0bC5ycwo+ICsrKyBiL3J1c3Qva2VybmVsL2RybS9p
b2N0bC5ycwo+IEBAIC0xMzUsNiArMTM1LDEyIEBAIG1hY3JvX3J1bGVzISBkZWNsYXJlX2RybV9p
b2N0bHMgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC8vIGRldi9maWxlIG1hdGNoIHRoZSBjdXJyZW50IGRyaXZlcgo+IHRoZXNlIGlv
Y3RscyBhcmUgYmVpbmcgZGVjbGFyZWQKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvLyBmb3IsIGFuZCBpdCdzIG5vdCBjbGVhciBob3cg
dG8KPiBlbmZvcmNlIHRoaXMgd2l0aGluIHRoZSB0eXBlIHN5c3RlbS4KPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZXQgZGV2ID0KPiAk
Y3JhdGU6OmRybTo6ZGV2aWNlOjpEZXZpY2U6OmZyb21fcmF3KHJhd19kZXYpOwo+ICsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIEVu
Zm9yY2UgdGhhdCB0aGUgaGFuZGxlciBhY2NlcHRzCj4gaGlnaGVyLXJhbmtlZAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8gbGlmZXRp
bWVzLCBwcmV2ZW50aW5nIGl0IGZyb20KPiByZXF1aXJpbmcgJ3N0YXRpYwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8gcmVmZXJlbmNl
cyB0aGF0IGNvdWxkIGVzY2FwZSB0aGlzCj4gc2NvcGUuCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZXQgXzogZm9yPCdhPiBmbigmJ2Eg
XywgJidhIG11dCBfLCAmJ2EKPiBfKSAtPiBfID0gJGZ1bmM7Cj4gKwo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIFNBRkVUWTogVGhl
IGlvY3RsIGFyZ3VtZW50IGhhcyBzaXplCj4gYF9JT0NfU0laRShjbWQpYCwgd2hpY2ggd2UKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAv
LyBhc3NlcnRlZCBhYm92ZSBtYXRjaGVzIHRoZSBzaXplIG9mCj4gdGhpcyB0eXBlLCBhbmQgYWxs
IGJpdCBwYXR0ZXJucyBvZgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC8vIFVBUEkgc3RydWN0cyBtdXN0IGJlIHZhbGlkLgoNCg==

