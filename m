Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795640587;
	b=kQy176+hAa96RoxErZKDsOyQCQljKriYIMZdoM9ScBHGW0uMyS3pKJAfgB+Ncptp94f3
	 We2rNLgRPjwEIcmeZ1E/kPYsnqq7NJRwDb0jnGURZRlvTg18gfpTNER6Loq/zDV8K6de/
	 dX0qKiCiqeSznuW2CoF5RA40fl/vK5EhyBo345TEcZzhJCDPg1iFLg+uS8ifMThUfyHds
	 OuO1na8NQYO5CCYVZ+TnnGjUpVyRZVa8ZE1fR6pX+r/MTsn97fe1F0vNBTlDw2mH0zUKA
	 lJhbcqhfObZGxqj4cUtP3bDNz2xpYj+ZPcx8tkfIdlW0oqP3TOf1gzKBcMja8GWPebg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640587;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=YkNlt+uKLADOZuplhNVa0yz6s4jz80shVgstOdfT/Ro=;
	b=Ns+vIfsnFWYT+5ODuL4B9gizM82qEu+MS8GrhzJ/XvTzJJ2O6t7TrPBA7p6Fh6bVAolX
	 14Ly2VNwKRNoMqhhOgf8BY8uU33CNLmhqyYrlTOxXQFG9ejbC7AUIiYb/HcpeG7zWHUwN
	 fKoOiSRWwXWGhh2JKdiqIGU2URmGHMnHF0rLhs7uvzIWsDHCMhCKaZtUj+vKPASjwAeKi
	 GyHDuE4VBmi6nh5iLKybcz1zS54iPBgjynDnqxYnQx9VYGHc+ssL8K72XpTy5nuSz7eH8
	 aWi/n1uTbDYzHv8+D5gyibE9RpOJ8S+unffGb9A1bUwiAPwVZw623pARkHMXoWUrWnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=JA9mkt0g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DFA606A33D
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 21:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71DFA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=JA9mkt0g
ARC-Seal: i=1; a=rsa-sha256; t=1795640557; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gaBZDKBMhJQotJZvAO9dmkqbsWeSRLa4D5euUsXMXiMl71urKvbu2oOaQwCoIDDAkRH4LIXCBm/PjVYQpJWJ9KUQ+PnSqQao9VO1fbOvnoUOSBV3qJ2OCZiQmainIsXs4P4w8u3VknNeP9Ha2Dd6N7/ob3/Oho2PFwAkd1imyL0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795640557; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YkNlt+uKLADOZuplhNVa0yz6s4jz80shVgstOdfT/Ro=; 
	b=K9W/eHou/RyXErOLS1eKRWTT18c3oyNjhZciNb4six7Wz7ZzHtloR0pKa/2kR9MSAJn6xlYBhk5MLZutXshTCGnjyo1b4VJLqtLgqELhU8N/hVdTkOhgJkHGiiLQB+rFtRApPPwyxrrImb8RUZjw+34mOdKJUtXQihmuA0ra5Bs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=JA9mkt0gxPLJBAxVFbkZ2TkRrnqihs1+c7c/AIlZqkPg2IGAfZDJDotIUTZHRY/5Eew/nohVwbGgVLcouAy2Qgm0+v9a0oVJZMywsNTWoFFhPneshuWsTkxG/dkJEbapqIBSvpOhCRGg9NqZA9Nblyo2fWfC3Q0VsEKKJYO9vs4=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=YkNlt+uKLADOZuplhNVa0yz6s4jz80shVgstOdfT/Ro=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179564055584856.10191565405103;
	Wed, 25 Nov 2026 13:02:35 -0800 (PST)
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
Subject: Re: [PATCH v7 10/10] drm/tyr: add BO-related ioctls
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20261122-tyr-ioctls-v7-10-3a2af624b992@linux.dev>
Date: Wed, 25 Nov 2026 18:02:17 -0300
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
Message-Id: <1B531CBF-FEDB-4F99-AFE8-D6DCCAA5697A@collabora.com>
References: <20261122-tyr-ioctls-v7-0-3a2af624b992@linux.dev>
 <20261122-tyr-ioctls-v7-10-3a2af624b992@linux.dev>
To: Alvin Sun <alvin.sun@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External

Hi Alvin,

I will wait for the refactor on the last patch, since this one will
change in a few ways due to it.


=E2=80=94 Daniel=
