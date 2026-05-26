Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4C236AF6;
	Tue, 26 May 2026 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806381; cv=none; b=u97KOmBBRJWWthHO4cwQYbrG9KpqcnBm9f7ANIABPk6NI5UttKJa3g9nIdXJV7c8me4CJKjckutDMgbkBsBl5zlJOZw6NmZTiWoh6ViMngOxxbC0WJpWrwKI/nx3YjHfAW/pZNTQjrdFbhcvRG0Inn44tYIWSy1BZZoIIDISrJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806381; c=relaxed/simple;
	bh=d1S+PsCKIpg1/cD/dU/mWGcpd/n98yRfyADqjCIv/wE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cpe+1NU3kBsMct00rQLLH+c7FfWtrEoptCvJrQ2IeEgr4WqUO8rL2CFU8a3JY/fveCreJrGs3l5+rB4q1ia7n4xT8Mq2h7QmZC9tXzjxMgSFqaNxgrq2lzJOJbXVMi9Brmq0Y2lE8gPcioydMbII4Mb5sTnaxOoSEpburevDr0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQDj12Ho; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQDj12Ho"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28901F000E9;
	Tue, 26 May 2026 14:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779806376;
	bh=wd13JqkW4GNpk4HsdTUvj5eq3ICQ0BjZkVsaOq4K1yE=;
	h=From:Subject:Date:To:Cc;
	b=AQDj12Ho6a6Fdjw/qr0Xov+HBAACq3TSPAdubztKJsUojTu4lFU7klxSXcPOl/Aws
	 aktq4VCsfIFgxORPOtlaJV/mCcHakZ7JoEhOBQdLTgwttOiQEjFCYZ38SpEN2UCJ9P
	 +bkQDUJnOdAeRrVm0+2PeYDYuk9VENBH7B+fgRWRGtHnnRE7IyVZQZKj32jAvNzYMO
	 E9MqyXWvnVionnCOFQ5SYNyOmGvsHrhayjFSKefZLVPtwKlGEuSxO9KaBzKf6Rty8f
	 lpL2YSYvyurlcpyw1if0/BaP/dX+MtH0+pfN+fuGseBZUFEUdRDcMO/RIobLNoPYuF
	 g+w1MaKIgOGrg==
From: Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH 0/2] rust: device: remove ref-to-ref transmute
Date: Tue, 26 May 2026 10:39:30 -0400
Message-Id: <20260526-trasnmute_ptr_to_ptr-v1-0-d89bc1dda3b5@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrBuIIVXsVUqRmI46hUaZGUUQ7
 95YV49v8f4dBJlQ4FHswLiS0JQyylsBcQxpQEPvbHDWVfbuKqMcJH0XxXZWbnU6xwSL3rvaNzG
 WkK8zY0/bP/t8XZal+2DUswXH8QNfE4xHeAAAAA==
X-Change-ID: 20260526-trasnmute_ptr_to_ptr-a0e442749cc1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=741; i=tamird@kernel.org;
 h=from:subject:message-id; bh=d1S+PsCKIpg1/cD/dU/mWGcpd/n98yRfyADqjCIv/wE=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFmiG5ZxsVSI3dv67cHku+sFW9Xrk5ZuL1EuNbb+t1As2
 lvn41vvjoksDGJcDJZiiiyJoof2pqfe3iOb+e44zBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFPtkMjIcNfxdnHyu4lqTRET5kx5tCvz7TMDkd/OKxU42s06N8XO2M3IsCpr5Za
 dDy9dtj+qd2jdql6PZOPc1dv9t8w8xf7Y91Z8ERMA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

This series came out of discussion with Alice in another series[1]. It
removes an unnecessary unsafe block and optimizes away an array copy.

Link: https://lore.kernel.org/all/CAH5fLgibt_BQmOtkfEfo1=48zUeoWBJ-=u5gzw_a3X6Q7=aUSA@mail.gmail.com/ [1]

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
Tamir Duberstein (2):
      rust: device: remove unused ref-to-ref transmute
      rust: device: remove array copy

 rust/kernel/device/property.rs | 46 ++++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 26 deletions(-)
---
base-commit: fc1ce3afa2e61b4b15e71436ece91b0441a9f4f0
change-id: 20260526-trasnmute_ptr_to_ptr-a0e442749cc1

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

