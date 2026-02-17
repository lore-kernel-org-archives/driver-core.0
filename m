Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5792D0602;
	Tue, 17 Feb 2026 22:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771368981; cv=none; b=IaDkUAJvRTCu8JLefpQa85RgfTu4eK5c+8XjN0x5fBcri498sd6RJ8ANLxV4A6tmFWPSjY+ohawtGQN90WBly2E8P2yK7MwXrqgzA69KRWbVihtFdgPHxEE3kswnw54VENaub1qILtNjuZDWwAZ6isD/koEbfsSk+mkaW6CNnnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771368981; c=relaxed/simple;
	bh=RAikxamDCHEdUoVhGZBtjocXME2+8GmjeCxZ0hUWcxA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ciOfnS62ieZCm86M2WfEcuKW+Mlny5jq5BHZ1jRxl9bWqGxKm9pX7YK5Y759zNeJ0mmgcv2dAdyBGcFeIprw9bXLEV2IEK7nXI9csH9ITimWOLy4Lq+MN9JHm5ZkFVmat6RMPkMgLAgPgA0NxoEAsZ/NazJC2i1h8eIigctouOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwzY7NXg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwzY7NXg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3523C4CEF7;
	Tue, 17 Feb 2026 22:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771368980;
	bh=RAikxamDCHEdUoVhGZBtjocXME2+8GmjeCxZ0hUWcxA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=hwzY7NXgIwfoEDUVz7NS4tP8/V5FWkzUkYXoiktYALtnQ6X+ZRvPgltQbnkbOkQsL
	 PElA8ITZKy9ka8MXdVxt7pWQ1450DpHdvvllRbcl1YfgoM/KS9vnVGJ18esyrFKqoA
	 z+GfrA41FAqvmHl7jSiIoJaCpqMERrHXV+e1piJEIQ4Q5CQdOf8Pil2BN4C2d363NU
	 7I3+/oU7Dp4XoiHd8GdERG4xcrqo55gRH7oPXPeJ0cYSYgy8facXpPaqFxcXlb9JCK
	 n7irg/6B6iYuTt9FVh8nKs+yIwpct5t2Vh2PRoa8yIHJ8XHlUVfvOckVeQ0QeXu3pa
	 T0tUIl6qu36GA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 23:56:17 +0100
Message-Id: <DGHLWAFPCCUD.CK5E70Q832CY@kernel.org>
Subject: Re: [PATCH] rust: irq: add missing 'static bound to IRQ callback
 functions
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>
To: "Cole Leavitt" <cole@unwrap.rs>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260217222425.8755-1-cole@unwrap.rs>
In-Reply-To: <20260217222425.8755-1-cole@unwrap.rs>

On Tue Feb 17, 2026 at 11:24 PM CET, Cole Leavitt wrote:
> The Registration<T> and ThreadedRegistration<T> structs require
> T: Handler + 'static and T: ThreadedHandler + 'static respectively.
> However, the callback functions that are used with these registrations
> were missing the corresponding 'static bound:
>
>   - handle_irq_callback<T: Handler>
>   - handle_threaded_irq_callback<T: ThreadedHandler>
>   - thread_fn_callback<T: ThreadedHandler>
>
> This bound inconsistency was previously accepted by rustc, but recent
> compiler versions (1.93+) enforce E0310 more strictly when casting
> raw pointers to references in generic contexts. The callbacks cast a
> *mut c_void to a reference of the registration type, which requires
> T to be valid for 'static when the registration struct requires it.
>
> Add the missing 'static bound to all three callback functions to match
> their registration struct requirements and fix compilation with recent
> rustc versions.
>
> Fixes: 135d40523244 ("rust: irq: add threaded handler support")
> Signed-off-by: Cole Leavitt <cole@unwrap.rs>

Thanks for the patch! "Unfortunately", there is already an equivalent fix f=
or
this on the list.

Link: https://lore.kernel.org/all/20260214092740.3201946-1-lossin@kernel.or=
g/
