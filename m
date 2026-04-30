Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21766314A65;
	Thu, 30 Apr 2026 16:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777565131; cv=none; b=nSp5v8G5R3h0hYMwnBTwcK1RYpa4hRiqzZKEuTCQey93pqu6kJnMzE0dM9UsdagmSOS3UXhVD38+ahy3idbXX7j5XEdmKM0VFHWUP38WqebqzKkgLl9bsgl9iR1PZ9kcd8CDCxmChtl5mWow+bCTOmDpTZuoyoosEdD39xp0few=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777565131; c=relaxed/simple;
	bh=I0Hn6+UL9P7mFG6XXZHpwThds4PDPN5q1vkLTTgDkVY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=GD/zreTecBnXhYISv+R1svn2pyOSP/YHapIS8VJ877bQ4vrMd/SR0KpJPMbKJV0UQxyx8KLyefXs1EDOMCoqxTck9Zmaa/Ow0Xs0lfHpG1kD4iDh0dAwmH36k0mDb2WKQAycHPlLjOrX4MUB1hxEzwyuS7X2SnS3uvPidRdKiVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uo2y+bxO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uo2y+bxO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A581C2BCB3;
	Thu, 30 Apr 2026 16:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777565131;
	bh=I0Hn6+UL9P7mFG6XXZHpwThds4PDPN5q1vkLTTgDkVY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Uo2y+bxOm2Qn6x7k7/chYmmzqsW9W6qHCbQ1MN9Zdszme+dDUXno2NwyOPefdHpw6
	 JsjqyeyiGiWlYyfLzxbhw0TzlFoJemCKGhTpGTiDJuL/LbXKWuNO3YoB1HNdVsNXLg
	 0X3b4i8q4Nw0BezQwnW03Dzo3c7p5vd4M4DbJcUCqL08OTgJqp+1JbmVQpWHXdzMm8
	 qGE3aJzF4P0VYW1ZoY+C5QEtYIryBYbMJoFQs1mvanhHP/KPyUSYa5a5RWLxAlz7UW
	 BGojLiwL5AuNx5ZftMW4Dz1GqwRsbJkX1ePVmfqmKp+mM3UdPes2RqZvlflkfLXcsX
	 Ok7r7m1b1HcYg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 18:05:26 +0200
Message-Id: <DI6M8XMJUG33.2NYL9UVC0LLRM@kernel.org>
Subject: Re: [PATCH 1/2] rust: auxiliary: add registration data to auxiliary
 devices
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <acourbot@nvidia.com>, <aliceryhl@google.com>, <david.m.ertman@intel.com>,
 <ira.weiny@intel.com>, <leon@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260427221002.2143861-1-dakr@kernel.org>
 <20260427221002.2143861-2-dakr@kernel.org>
 <DI6L13A5LMOW.DU7ZTHXZYB0K@garyguo.net>
In-Reply-To: <DI6L13A5LMOW.DU7ZTHXZYB0K@garyguo.net>

On Thu Apr 30, 2026 at 5:08 PM CEST, Gary Guo wrote:
> I wonder if we could require auxillary drivers to specify a type, and the=
n the
> abstraction would check if the type matches; if it matches, it create a
> `&Device<Core, T>` and `probe`, otherwise it skips over the driver comple=
tely.

The choice not to type auxiliary::Device over the registration data is
intentional.

The registration data is not intended for the child driver to use, but for =
the
parent driver to retrieve when the child passes its device back to the pare=
nt.

By typing the Device over the parent's registration data we force the paren=
t
driver to expose its registration data to the child driver.

>> +    /// Returns a pinned reference to the registration data set by the =
registering (parent) driver.
>> +    ///
>> +    /// Returns [`EINVAL`] if `T` does not match the type used by the p=
arent driver when calling
>> +    /// [`Registration::new()`].
>> +    ///
>> +    /// Returns [`ENOENT`] if no registration data has been set, e.g. w=
hen the device was
>> +    /// registered by a C driver.
>> +    pub fn registration_data<T: 'static>(&self) -> Result<Pin<&T>> {
>
> Any reason that this is not just `Result<&T>`?

Mainly consistency with other APIs, but I'm not really opinionated about it=
.
