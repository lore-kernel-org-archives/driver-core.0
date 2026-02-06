Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4684B2D7D3A;
	Fri,  6 Feb 2026 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770393418; cv=none; b=QISohHnusN8gnoCtr9wFyoaQQ0m10CyXLiSkUhd/3FneUPkHj7MZc5+roVfTHFHSgjxXsOwHJ1pJGmwcagWTCEOajcqspgLM61hOLLOH5fBbMYCfIVmYjCRcu2hieT4/xWTlArqQOxbMGXDsxPE3RfRXoQdrmhYUe38bOZUWtMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770393418; c=relaxed/simple;
	bh=tcweDRk9v7bZFlbgfsWkBPPPyrjaIKxoM4oyedj9/2E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hnhTQWb2GwqTTDtAOQUAWVqHS7+mmYsrJ2UQjCzMXmDL3EVFPbV+fkoknTnqw6f3QrYqwK3wciGF2YB+l5wvOArpWyHLebth0LOYvWumNSD6mcNo6HMyddpWmjVWg8ybb/YQIeHi1rBF0fIeHMMohYFmiSvztAun5NkfBlBN6pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQXJQQQx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQXJQQQx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27EAC19422;
	Fri,  6 Feb 2026 15:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770393417;
	bh=tcweDRk9v7bZFlbgfsWkBPPPyrjaIKxoM4oyedj9/2E=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=FQXJQQQxeODyZFCPnx61EnfufPAmCJLpT40+R2I99ViV2TXgE4qlnnjbt5oXW+96i
	 qFEIKzOMtKfnwbUeKIWHuL/O5pXXGreWRqIrZSKnfTBEncGeMaS7JmcsqZwgHrKaAl
	 I6axeQeammVCo1HwjXN71JKs83Xc9VK9Mtqn2VGej+YDVhNxrFgeHkYs+NMLnr4V+U
	 o1Tsn6vpmdVkKMC4PKq6o0oXVH3wTte4fCn6GsBr5SJ69ZSf9SADD3lqtASIWV0oSQ
	 lYXqOCMCLGfMWzgIjxH5vpWBL594SdccmcazUMOD9oHEmFoMazjseUjAd5dHMe/Yhm
	 podtXlZ6P6QJw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 16:56:54 +0100
Message-Id: <DG8036NHQJ98.3A2RTSB6THUB3@kernel.org>
Subject: Re: [PATCH] rust: devres: fix race condition due to nesting
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Markus Probst" <markus.probst@posteo.de>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260205222529.91465-1-dakr@kernel.org>
 <aYYOoyD8QAHEsWTp@google.com>
In-Reply-To: <aYYOoyD8QAHEsWTp@google.com>

On Fri Feb 6, 2026 at 4:54 PM CET, Alice Ryhl wrote:
> On Thu, Feb 05, 2026 at 11:25:15PM +0100, Danilo Krummrich wrote:
>> Commit f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc") did
>> attempt to optimize away the internal reference count of Devres.
>>=20
>> However, without an internal reference count, we can't support cases
>> where Devres is indirectly nested, resulting into a deadlock.
>>=20
>> Such indirect nesting easily happens in the following way:
>>=20
>> A registration object (which is guarded by devres) hold a reference
>> count of an object that holds a device resource guarded by devres
>> itself.
>>=20
>> For instance a drm::Registration holds a reference of a drm::Device. The
>> drm::Device itself holds a device resource in its private data.
>>=20
>> When the drm::Registration is dropped by devres, and it happens that it
>> did hold the last reference count of the drm::Device, it also drops the
>> device resource, which is guarded by devres itself.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Thanks for the review!

>> +        // Take additional reference count for `devm_add_action()`.
>> +        core::mem::forget(data.clone());
>
> I'd feel better if you called .clone() prior to devm_add_action(). That
> way, even if devm somehow runs the callback before we get to this call
> to clone, the refcount has already been incremented.
>
> I know it's not really a problem because of the &Device<Bound> argument.

This is intentional, since, as you say, &Device<Bound> guarantees that this
won't happen and since otherwise we'd explicitly need to drop the reference
count again if devm_add_action() fails.
