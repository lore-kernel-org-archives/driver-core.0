Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795632773;
	b=RQ8laPljjuBND+mQXJLudhYVaJ0sAalYLqQt3b552KPLhET4LWzA6LHWMqOtP6C/iE4Q
	 +xnzALsMVsHjoQsDz3VY9UY2GxXSA30dUtNWV3crUlXDwTuDZD8tthxAfUbW6dwCKzK0/
	 QAlIznL+69x/7RGRXrekjTrmDPhTr0AjB/+ChHnn6dI+t6WxBgBZd9MUviOzICtMXxKpF
	 P51ZNNtxKJng60Y/waIRuRwmPaU0S9p5/rwGhXS2zgG0kJ5/qaoPPzW6ou+E0LbY3rfla
	 Iv6ofIJeOatbncjUOIxycO7cdHRkj/CTdX3aZu2v/dtSm5Wq9ldSDMGVAMbPqPuvSAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632773;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=W99NhWI3ygRMunVK1S8lQJXKOnRg3ojh/zXSqGdm6WP663vSW5XRvPNL3sEPwBkEAHSG
	 2ruCVe5iaU+1I5fazmzSjclgLJFSmqp66GttlqvNw7FcJAzgGkmGyF89g/Rm0YMiZ0Nf7
	 XFQhUPEmeEmt69PmP3bBkEyiIfRdfqk09hxlS227u5opqO1PoHCBooB+A9MQhmnDgKaEB
	 Rq0T534kIosFF4GCWdZoPl8eIdQFMCpMuPOzxnXr1IjBbkj/6tKhR+Ok8eiIwXU/AYFGY
	 M6tfUjy7bHCe8EUqm3ZOwJctZg1OEp/qvcYVoT+0eaYyl3Mac/9hKeOSzmlPIYWFZhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=MnJh7yec;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E936606A329
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 18:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E936606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=MnJh7yec
ARC-Seal: i=1; a=rsa-sha256; t=1795632747; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=alzVgPqw3eyocbsHvDDCQLv4Q3A9mR0J6QQ0Z5rKUGzZH64moKjaZUDpzWmLyGtzEJtHibTlR8LUTmBgYuVUapXBHKtwIfY+uPsORFOwqGbktGXujaR4y8OcKQqH1KwI6TxFk1rgAt50pggHV6DbsrNqHutq/FYo/tbKJrh4B3I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795632747; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=ORs8YV9paKzK1Nc4mbHX4K22nYS106KQcn0Fqmwxh1Z0axMPeiZYRJGT4WZZSyEwKrWQwhZ8Zasra98Agr2XFOi8zWMtKx2YSVgybXPjkRNhNkEWC4YxQZ9aesMuzI/HlM08GqmoEO5LC+b9DmnNEy+1hSrPkW1EuN0o4CLPhyc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=MnJh7yecbugOwAyFX1HFA8JALraXKM46wSxfnry5NWqfpITaD4mMqoEGD5VfV3A8JHjNL4IaYQrEp42DLQ+rlZkPsT2VL58bI5P9BE1SPKzCnbwW6FeZ0fQWbZXXNqJQzYrC1bRxhWyHktqTTV9hGVZdx0tVMH2MVsttw+o7cyA=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795632746112307.22570697106903;
	Wed, 25 Nov 2026 10:52:26 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v7 08/10] rust: device: expose the device DMA attribute
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20261122-tyr-ioctls-v7-8-3a2af624b992@linux.dev>
Date: Wed, 25 Nov 2026 15:52:07 -0300
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
Content-Transfer-Encoding: 7bit
Message-Id: <53EA90E4-BA47-413A-B8CA-7788F7AE9DD9@collabora.com>
References: <20261122-tyr-ioctls-v7-0-3a2af624b992@linux.dev>
 <20261122-tyr-ioctls-v7-8-3a2af624b992@linux.dev>
To: Alvin Sun <alvin.sun@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
