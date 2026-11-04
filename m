Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790327;
	b=iIMS92crPkaZ9jMrE5AJxTKY5XeJceJxDiegVBIvWJ+CJdfOohrhqN4wUwT05heK6mzz
	 wkX70VqRvmnuIVReHk3b43x4NUtQ/mqBQ61xYJUqk9xbaLVHskbQJrLONRbHzxd3o9Ztx
	 PAU+dnzel6b0eSwVyMQmKjEYNvL8JLE3YnHd5+rWAetj8eTkEQyrqDXFol7OJbXuv7Jok
	 FaOZYgJu/n1l9S++zFWs2ZhZlePgpg96z/fgn+NTpI4jla5dIPfPZB9oYq+qIKuDhIHrB
	 7aoCMieIE/QXElBBnDIdGQ8w/lFR25LmjUxb8LkrTKrS/jk7GguxzukH2pBnGUF+vLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790327;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=opy80jKn+rSOIath4t5eraiHJMHOwCJGuvZQsIVjRWQ=;
	b=jqU499lJ7nOL6FAw2bffrwLarJpyB6diJ0I/MEybFK7H1vLQ5sevVUNVogvzSW8VZ7xN
	 ajbw2zPPOHVHJ/FNgxCdengrcFGwNB6YBLNkXn06QGvlCmyipIZwOiROCjxDW7a9EpJR+
	 o3439jVllsyB3fYLWVRlkY9iOfG5LkvJigdiYSZMMD7zFoSE8fuR7bmDiUwwFbdcDW+NN
	 ArcyhZ75auZc2bth3Cld8SCrL8V3g7LTFwLDvXBHzJvQXKanmZ/JP2PbQbCw2r7x40vEw
	 AhTmxJ58Qh3yLJlMUP1tCOhhEwepjnS41iBbnmsQHmARaSZ/wBboH9EqzCPEyivlZPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eT1Na2tV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89472606A31B
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 11:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eT1Na2tV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3081F000C1;
	Wed,  4 Nov 2026 11:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793790327;
	bh=opy80jKn+rSOIath4t5eraiHJMHOwCJGuvZQsIVjRWQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=eT1Na2tVUo4llRXZvpiR+FbZibPtLVIy4Rni493dAGoHH9GdLQPkv9I5o4NRNcQRQ
	 6trxFFdgyoCvx+3Fvx2nQGJgTGXyoYrD8sUMo27ONkwcSIbQrQyAwA6Gw/c0qSjjyY
	 7jjJaCCggrSxEj0u7UQV48alHerDms9o/QJwMRO6yDlhXXZRYMhinhDiRIs7RZU3QW
	 VLjYGV5CIFbQZnHsENBFxiLUHai2Tm9mEn5DJi+DYPWgHriUyJr/PRmPNr9gidFjpT
	 j6SYpOAZwLStVa7o493CVpuz5xfHgrgnfkI7Jli/AM+Kf6DjI+o0aRNTXXAqVyDulj
	 v1TR1rhzHYr7A==
Message-ID: <0c138266-d92c-4452-a063-31d1d4b43869@kernel.org>
Date: Wed, 4 Nov 2026 12:05:22 +0100
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver core: don't update the status of an autoremoved
 device link
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>, "Rafael J. Wysocki"
 <rafael@kernel.org>, driver-core@lists.linux.dev,
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
References: <20261104025343.1527458-1-vulab@iscas.ac.cn>
 <20261104-thoughtful-real-saluki-8cae0c@quoll>
 <2026110438-washbasin-stylishly-8e48@gregkh>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <2026110438-washbasin-stylishly-8e48@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/11/2026 11:52, Greg Kroah-Hartman wrote:
> On Wed, Nov 04, 2026 at 08:11:13AM +0100, Krzysztof Kozlowski wrote:
>>>
>>
>> Multiple things here:
>> 1. Your team ignored completely previous feedback. Multiple times.
>>
>> 2. You use multiple identities with this email address, thus I doubt that we
>>    speak with an actual person.
>>
>> 3. Your bot does not even bother running checkpatch, right?
>>
>> 4. Nothing of this was reproduced nor tested.
>>
>> 5. Finally, the same feedback:
>> You sent multiple independent patches, to multiple independent
>> subsystems. The amount of these patches clearly suggest this was
>> AI generated and most likely not tested.
>>
>> More importantly, you sent all this work without properly organizing
>> relevant patches into patchsets. This makes reviewing difficult
>> and might cause multiple reviewers to address the same issue.
>> Replying to the entire set is impossible and requires handling each
>> patch independently, instead of applying or discarding the set.
>> Maintainers also won't see the bigger picture of your work. Quite
>> worrying.
>>
>> This is on the verge of hostile patch: bomb us with so many
>> contributions, we won't be able to handle them in efficient manner,
>> like responding ONCE to ask you to slow down.  Considering all this
>> is untested and LLM generated, I have even more doubts whether this
>> should be considered for review.
> 
> They are now starting to send out private patches and avoiding the
> mailing lists entirely.  Time to do something a bit more drastic to stop
> this mess...

So they did read my messages eventually! Meh...

Best regards,
Krzysztof
