Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240071;
	b=MLr1IsHTuWdC4bf85Od+2Nanlz3VKRDyrBQoLYW0A2T1km01RG/m4hnFr5Rl00GW2oBR
	 JnbQ8BMTFXfddIfFYITjlm21PT/hTEYRoymvOWQisGmm5DfVIVbX/8eEmkePb6cpDQGfz
	 9LwXj5O8e5pB4eEb6hDOtzFzYqoSsH3iMJplDn0qTtJTW9zEMJngrP8sETBLI6oYcsbWT
	 BoFn8OBYsYvmZMHgVlRJQewsqgiLe4+1a8G0ovk6mdUJ9T85g2AwQWqC+x7AkAmh8MdBA
	 ZlNK8MFTV94MZX6dBjXUDt/48JQvlu0USsK3ir1tzYhUK8UAfDeOHJi5+xkiLrq7iJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240071;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-META:
	 X-MBO-RS-ID;
	bh=VGqvIZTeVHHkea6oie5gbk4KQiLXb7VXMyLBK0xLLI4=;
	b=VmXOIVoml6ex10PC0FASCiM3VhwBetDK9BXFtjesTQry/p/nLhCianN2vbA88Mk/DiQO
	 endAWlqWpxEHlMV1i+Xf1q/XXEACuzkjAIsVBstderxJ6uOMrCcc2dpfiBUNLDjEWFEff
	 nGuAyQ8bjHzjxfebnY45oul7zQAogxmPqeBZsR+4hev2+h/vzZruMMc7JIsmeZ3s2DzQF
	 cWbXO30KdOtnBkj6RJfE26T0yPeNDzZ+YQcDR8N0n3dwbZhq8FFXdCl3bexKpWUWCaGpY
	 1ttBp0/U/HT35lN6SEZOtMUmXwSXpLsY1UxLvgpdenIEZ0U7HAxfZNaNBQUyDe22wJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=PzG31H0N;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FEC60A3835
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 16:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10FEC60A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=PzG31H0N
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jNZJf4DBlzMlJx;
	Mon, 09 Nov 2026 17:01:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794240066; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VGqvIZTeVHHkea6oie5gbk4KQiLXb7VXMyLBK0xLLI4=;
	b=PzG31H0NZ8MVBErZ7/kMvgJropYLGKQt9w/FEl40CC21vwMf8ubo26W/r/QafG8Tlr69mw
	jj+YgAgrMoBzO7/83ZsXjCjDZtWMK40iUz/LRaQFBZNW+oiS9pZT1V9qXh8wxA5OindNtH
	TpHRgx4BjlZ3NtNP4XjEG5gU88N1H8Sd/90bi/XGuY55k7xjiOJgprxYt+ItRQ1MtFCA6e
	u1sZAPmRooJSW9BRuYI5IDkPck/TGfwT+r3PuYmIjDWsi8YdYFSqU7be12jphkraicF6dz
	LAOybYpCHpdpS+6gsB9g9f5xqdIW1JAgHT6tSCfPVvC9v0VuCFp7hl/n/4LHnA==
Message-ID: <ea9f1aff9671e3d959141bc9aef2b23ebb2e1ecf.camel@mailbox.org>
Subject: Re: [PATCH v3 2/4] rust: workqueue: create workqueue subdirectory
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>, Lai
 Jiangshan	 <jiangshanlai@gmail.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
	 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Daniel
 Almeida	 <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>,  Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?ISO-8859-1?Q?=D6zkan?= <work@onurozkan.dev>, John Hubbard	
 <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Date: Mon, 09 Nov 2026 17:01:01 +0100
In-Reply-To: <20261020-rust-workqueue-v3-2-ea7c74d02068@google.com>
References: <20261020-rust-workqueue-v3-0-ea7c74d02068@google.com>
	 <20261020-rust-workqueue-v3-2-ea7c74d02068@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-META: m8ssoa15w3cpmbc413ypfmysjd9yk9nq
X-MBO-RS-ID: 6027c2dbc27f1abfb0f

On Tue, 2026-10-20 at 12:52 +0000, Alice Ryhl wrote:
> The following patch will implement a workqueue builder in a separate
> file. To prepare for that, create a rust/kernel/workqueue subdirectory
> and move the existing file.
>=20
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Philipp Stanner <phasta@kernel.org>
